"""Development-only xv6 crashat probe; not a tool exposed to the AI agent."""
import socket
import sys
import time


def receive(sock, timeout=6):
    data = bytearray()
    end = time.monotonic() + timeout
    while time.monotonic() < end:
        try:
            chunk = sock.recv(4096)
        except socket.timeout:
            continue
        if not chunk:
            break
        data.extend(chunk)
        if b"$ " in data or b"panic:" in data:
            break
    return data.decode("utf-8", errors="replace")


if len(sys.argv) != 2 or not sys.argv[1].isdigit():
    print("Usage: python3 scripts/crashat_probe.py <nonnegative event number>")
    sys.exit(1)

n = int(sys.argv[1])
if n > 100000:
    sys.exit("Event number is too large")

with socket.create_connection(("127.0.0.1", 5555), timeout=5) as sock:
    sock.settimeout(0.5)
    sock.sendall(b"\n")
    hello = receive(sock)
    if "$ " not in hello:
        sys.exit("No xv6 shell prompt; received: " + repr(hello))

    command = "crashtest " + str(n)
    print("Sending:", command)
    sock.sendall(command.encode("ascii") + b"\n")
    output = receive(sock)
    print(output, end="" if output.endswith("\n") else "\n")
    if "panic:" in output:
        print("Guest panicked as requested. Stop QEMU and restart using the same fs.img.")
    elif "$ " not in output:
        print("No prompt returned; inspect the guest output above.")
