"""Small standard-library client for Groq's hosted chat-completions API."""

import json
import os
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


class HostedAPIError(RuntimeError):
    """Raised when the hosted model API cannot return a usable tool proposal."""


def _load_project_env():
    """Load supported settings from the repository .env without dependencies."""
    env_path = Path(__file__).resolve().parents[1] / ".env"
    if not env_path.is_file():
        return

    supported_keys = {"GROQ_API_KEY", "GROQ_MODEL", "GROQ_API_URL"}
    for raw_line in env_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("export "):
            line = line[len("export "):].lstrip()

        key, separator, value = line.partition("=")
        key = key.strip()
        if not separator or key not in supported_keys or key in os.environ:
            continue

        value = value.strip()
        if len(value) >= 2 and value[0] == value[-1] and value[0] in "\"'":
            value = value[1:-1]
        elif "#" in value:
            value = value.split("#", 1)[0].rstrip()

        os.environ[key] = value


class HostedLLMClient:
    def __init__(self, api_key=None, model=None, endpoint=None, timeout=120.0):
        _load_project_env()
        self.api_key = api_key or os.environ.get("GROQ_API_KEY")
        self.model = model or os.environ.get(
            "GROQ_MODEL", "openai/gpt-oss-20b"
        )
        self.endpoint = endpoint or os.environ.get(
            "GROQ_API_URL",
            "https://api.groq.com/openai/v1/chat/completions",
        )
        self.timeout = timeout

    def next_step(self, messages, tool_definitions):
        """Ask for either one tool call or a final text response."""
        if not self.api_key:
            raise HostedAPIError(
                "GROQ_API_KEY is not set. Add it to the project .env file or "
                "export it in the environment before running the agent."
            )

        payload = {
            "model": self.model,
            "messages": messages,
            "tools": tool_definitions,
            "tool_choice": "auto",
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
            message = body["choices"][0]["message"]
        except (KeyError, IndexError, TypeError) as exc:
            raise HostedAPIError("Hosted model API returned no assistant message") from exc

        if not isinstance(message, dict):
            raise HostedAPIError("Hosted model API returned a malformed assistant message")
        calls = message.get("tool_calls") or []

        if not calls:
            content = message.get("content")
            if not isinstance(content, str) or not content.strip():
                raise HostedAPIError("Hosted model API returned neither a tool call nor text")
            return {"type": "final", "content": content.strip(), "message": message}

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

        call_id = calls[0].get("id")
        if not isinstance(call_id, str) or not call_id:
            raise HostedAPIError("Hosted model API returned a tool call without an id")
        return {
            "type": "tool_call",
            "action": {"tool": name, "args": arguments},
            "tool_call_id": call_id,
            "message": message,
        }

    def propose_action(self, messages, tool_definitions):
        """Compatibility helper returning one proposed {tool, args} action."""
        step = self.next_step(messages, tool_definitions)
        if step["type"] != "tool_call":
            raise HostedAPIError("Hosted model API returned text instead of a tool call")
        return step["action"]
