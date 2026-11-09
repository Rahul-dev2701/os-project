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
