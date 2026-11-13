#Planner that turns a user request into a hosted-model tool proposal.

if __package__:
    from .hosted_client import HostedLLMClient
    from .prompts import build_messages, build_tool_definitions
    from .state import AgentState
else:  # Support the existing `python main.py` launch from agent/.
    from hosted_client import HostedLLMClient
    from prompts import build_messages, build_tool_definitions
    from state import AgentState


class Agent:
    def __init__(self, client=None, state=None):
        self.client = client if client is not None else HostedLLMClient()
        self.state = state if state is not None else AgentState()
        self.pending_request = None
        self.pending_action = None

    def respond(self, request, tools, max_tool_calls=5):
        """Run a bounded tool loop and return the model's final text and trace."""
        if max_tool_calls < 1:
            raise ValueError("max_tool_calls must be at least 1")
        request = request.strip()
        messages = build_messages(request, self.state.planner_context())
        tool_definitions = build_tool_definitions()
        actions = []
        trace = []

        for _ in range(max_tool_calls + 1):
            step = self.client.next_step(messages, tool_definitions)
            if step["type"] == "final":
                self.state.record_turn(request, action=actions, result=step["content"])
                return step["content"], trace

            if step["type"] != "tool_call":
                raise RuntimeError("Planner returned an unknown response type")
            if len(actions) >= max_tool_calls:
                error = f"Planner exceeded the limit of {max_tool_calls} tool calls"
                self.state.record_turn(request, action=actions, error=error)
                raise RuntimeError(error)

            action = step["action"]
            actions.append(action)
            messages.append(step["message"])
            try:
                result = tools.execute(action)
                error_text = None
                tool_content = str(result)
            except (ValueError, RuntimeError, TimeoutError) as exc:
                result = str(exc)
                error_text = result
                tool_content = f"Tool execution failed: {result}"

            trace.append({"action": action, "result": result, "error": error_text})
            messages.append({
                "role": "tool",
                "tool_call_id": step["tool_call_id"],
                "content": tool_content,
            })

        error = f"Planner exceeded the limit of {max_tool_calls} tool calls"
        self.state.record_turn(request, action=actions, error=error)
        raise RuntimeError(error)


#Ask the model to propose an action for a request.
    def plan(self, request):
        self.pending_request = None
        self.pending_action = None
        messages = build_messages(request, self.state.planner_context())
        tool_definitions = build_tool_definitions()
        self.pending_request = request.strip()
        action = self.client.propose_action(messages, tool_definitions)
        self.pending_action = action
        return action

    def record_result(self, action, result):
        if self.pending_request is None:
            return
        self.state.record_turn(self.pending_request, action=action, result=result)
        self._clear_pending_turn()

    def record_error(self, error):
        if self.pending_request is None:
            return
        self.state.record_turn(
            self.pending_request,
            action=self.pending_action,
            error=error,
        )
        self._clear_pending_turn()

    def _clear_pending_turn(self):
        self.pending_request = None
        self.pending_action = None
