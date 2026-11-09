#Planner that turns a user request into a hosted-model tool proposal.

if __package__:
    from .hosted_client import HostedLLMClient
    from .prompts import build_messages, build_tool_definitions
else:  # Support the existing `python main.py` launch from agent/.
    from hosted_client import HostedLLMClient
    from prompts import build_messages, build_tool_definitions


class Agent:
    def __init__(self, client=None):
        self.client = client if client is not None else HostedLLMClient()


#Ask the model to propose an action for a request.
    def plan(self, request):
        messages = build_messages(request)
        tool_definitions = build_tool_definitions()
        return self.client.propose_action(messages, tool_definitions)
