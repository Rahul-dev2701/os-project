from agent import Agent
from tools import Tools
from qemu_bridge import QemuBridge


def main():
    bridge = QemuBridge()
    tools = Tools(bridge)
    agent = Agent()

    try:
        while True:
            try:
                request = input("agent> ")

                if request.strip().lower() in ("quit", "exit"):
                    break

                action = agent.plan(request)
                print("[Proposed action]", action)

                result = tools.execute(action)
                print("[Guest result]")
                print(result)

            except (ValueError, RuntimeError, TimeoutError) as exc:
                print("[Error]", exc)

    finally:
        bridge.close()


if __name__ == "__main__":
    main()
