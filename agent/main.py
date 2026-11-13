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

                answer, trace = agent.respond(request, tools)
                for item in trace:
                    print("[Proposed action]", item["action"])
                    if item["error"]:
                        print("[Tool error]", item["result"])
                    else:
                        print("[Guest result]")
                        print(item["result"])
                print("[Agent response]")
                print(answer)

            except (ValueError, RuntimeError, TimeoutError) as exc:
                agent.record_error(exc)
                print("[Error]", exc)

    finally:
        bridge.close()


if __name__ == "__main__":
    main()
