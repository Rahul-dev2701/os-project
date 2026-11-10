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

        # Keep the dispatcher aligned with ToolValidator's allowlist. These
        # calls are forwarded to the bridge; the bridge must implement each
        # operation before it can run successfully.
        if tool == "delete_file":
            return self.bridge.execute("delete_file", path=args["path"])

        if tool == "execute_effect":
            return self.bridge.execute(
                "execute_effect",
                key=args["key"],
                op=args["op"],
                path=args["path"],
                data=args["data"],
            )

        if tool == "set_crashat":
            return self.bridge.execute("set_crashat", n=args["n"])

        if tool == "restart_qemu":
            return self.bridge.execute("restart_qemu")

        raise ValueError(f"Tool not implemented: {tool}")
