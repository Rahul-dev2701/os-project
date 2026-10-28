from validator import ToolValidator
from qemu_bridge import QemuBridge


class Tools:
    def __init__(self, bridge):
        self.bridge = bridge

    def execute(self, action):
        validated = ToolValidator.validate(action)

        tool = validated["tool"]
        args = validated["args"]

        if tool == "list_files":
            return self.bridge.execute("list_files")

        if tool == "read_file":
            return self.bridge.execute(
                "read_file",
                path=args["path"],
            )

        raise ValueError(f"Tool not implemented: {tool}")
