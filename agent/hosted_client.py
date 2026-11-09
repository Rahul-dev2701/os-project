"""Small standard-library client for Groq's hosted chat-completions API."""

import json
import os
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


class HostedAPIError(RuntimeError):
    """Raised when the hosted model API cannot return a usable tool proposal."""


class HostedLLMClient:
    def __init__(self, api_key=None, model=None, endpoint=None, timeout=120.0):
        self.api_key = api_key or os.environ.get("GROQ_API_KEY")
        self.model = model or os.environ.get(
            "GROQ_MODEL", "openai/gpt-oss-20b"
        )
        self.endpoint = endpoint or os.environ.get(
            "GROQ_API_URL",
            "https://api.groq.com/openai/v1/chat/completions",
        )
        self.timeout = timeout

    def propose_action(self, messages, tool_definitions):
        """Ask the hosted model for one tool call and return it as {tool, args}."""
        if not self.api_key:
            raise HostedAPIError(
                "GROQ_API_KEY is not set. Create a Groq API key and export it "
                "in the environment before running the agent."
            )

        payload = {
            "model": self.model,
            "messages": messages,
            "tools": tool_definitions,
            "tool_choice": "required",
            "stream": False,
        }
        request = Request(
            self.endpoint,
            data=json.dumps(payload).encode("utf-8"),
            headers={
                "Authorization": f"Bearer {self.api_key}",
                "Content-Type": "application/json",
                "User-Agent": "os-project-agent/0.1",
            },
            method="POST",
        )

        try:
            with urlopen(request, timeout=self.timeout) as response:
                response_bytes = response.read()
        except HTTPError as exc:
            detail = exc.read().decode("utf-8", errors="replace")
            exc.close()
            raise HostedAPIError(
                f"Hosted model API returned HTTP {exc.code}: {detail}"
            ) from exc
        except (URLError, TimeoutError, OSError) as exc:
            raise HostedAPIError(f"Could not reach hosted model API: {exc}") from exc

        try:
            response_body = response_bytes.decode("utf-8")
            body = json.loads(response_body)
        except (UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise HostedAPIError("Hosted model API returned invalid JSON") from exc

        try:
            calls = body["choices"][0]["message"]["tool_calls"]
        except (KeyError, IndexError, TypeError) as exc:
            raise HostedAPIError("Hosted model API did not return a tool call") from exc

        if not isinstance(calls, list) or len(calls) != 1:
            raise HostedAPIError("Planner must propose exactly one tool call")

        try:
            function = calls[0]["function"]
            name = function["name"]
            arguments = function["arguments"]
        except (KeyError, TypeError) as exc:
            raise HostedAPIError("Hosted model API returned a malformed tool call") from exc

        if isinstance(arguments, str):
            try:
                arguments = json.loads(arguments)
            except json.JSONDecodeError as exc:
                raise HostedAPIError(
                    "Hosted model API returned invalid tool arguments"
                ) from exc

        if not isinstance(name, str) or not isinstance(arguments, dict):
            raise HostedAPIError("Hosted model API returned a malformed tool call")

        return {"tool": name, "args": arguments}
