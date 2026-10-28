import socket
import threading
import time


class QemuBridge:
    """Restricted tool bridge to a running x86 xv6 guest."""

    HOST = "127.0.0.1"
    PORT = 5555
    TIMEOUT = 5.0
    MAX_RESPONSE = 65536
    PROMPT = b"$ "

    # Guest paths accepted by this prototype.
    ALLOWED_FILES = {
        "report.txt": "report.txt",
        "important.txt": "important.txt",
        "inbox.txt": "inbox.txt",
    }

    def __init__(self, host=HOST, port=PORT, timeout=TIMEOUT):
        self.host = host
        self.port = port
        self.timeout = timeout
        self.sock = None
        self.buffer = bytearray()
        self.lock = threading.Lock()
        self.ready = False

    def connect(self):
        if self.sock is not None:
            return

        self.sock = socket.create_connection(
            (self.host, self.port),
            timeout=self.timeout,
        )
        self.sock.settimeout(self.timeout)

        try:
            # Serial output produced before the TCP connection may
            # have been lost. Request a fresh shell prompt.
            self.sock.sendall(b"\n")
            output = self._read_until_prompt()

            print("[Bridge] Initial guest response:", repr(output))
            self.ready = True

        except Exception:
            self.close()
            raise

    def close(self):
        if self.sock is not None:
            try:
                self.sock.close()
            finally:
                self.sock = None

        self.ready = False
        self.buffer.clear()

    def _read_until_prompt(self):
        deadline = time.monotonic() + self.timeout

        while time.monotonic() < deadline:
            index = self.buffer.find(self.PROMPT)

            if index >= 0:
                output = bytes(self.buffer[:index])
                del self.buffer[:index + len(self.PROMPT)]
                return output.decode("utf-8", errors="replace")

            if len(self.buffer) > self.MAX_RESPONSE:
                raise RuntimeError("Guest response exceeded size limit")

            remaining = deadline - time.monotonic()
            self.sock.settimeout(max(0.05, remaining))

            try:
                chunk = self.sock.recv(4096)
            except socket.timeout as exc:
                received = bytes(self.buffer).decode(
                    "utf-8", errors="replace"
                )
                raise TimeoutError(
                    "Timed out waiting for xv6 prompt. "
                    f"Received so far: {received!r}"
                ) from exc

            if not chunk:
                raise RuntimeError("QEMU closed the serial connection")

            self.buffer.extend(chunk)

        received = bytes(self.buffer).decode("utf-8", errors="replace")
        raise TimeoutError(
            f"Timed out waiting for xv6 prompt. Received: {received!r}"
        )

    def _run_fixed_command(self, command):
        if not self.ready or self.sock is None:
            raise RuntimeError("Bridge is not connected")

        # Commands are constructed internally, never supplied directly
        # by the agent or user.
        if "\n" in command or "\r" in command:
            raise ValueError("Invalid command")

        self.sock.sendall(command.encode("ascii") + b"\n")
        output = self._read_until_prompt()

        # Remove the echoed command if xv6 echoed it.
        lines = output.replace("\r", "").splitlines()

        if lines and lines[0].strip() == command:
            lines = lines[1:]

        return "\n".join(lines).strip()

    def execute(self, tool, path=None):
        with self.lock:
            if self.sock is None:
                self.connect()

            if tool == "list_files":
                if path is not None:
                    raise ValueError("list_files accepts no path")
                return self._run_fixed_command("ls")

            if tool == "read_file":
                if not isinstance(path, str):
                    raise ValueError("Path must be a string")

                # Accept either "report.txt" or "/report.txt".
                normalized = path.lstrip("/")

                if normalized not in self.ALLOWED_FILES:
                    raise ValueError("File path is not allowed")

                filename = self.ALLOWED_FILES[normalized]
                return self._run_fixed_command("cat " + filename)

            raise ValueError(f"Unsupported tool: {tool}")
