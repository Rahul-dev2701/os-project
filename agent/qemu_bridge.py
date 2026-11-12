import socket
import threading
import time


class QemuBridge:
    """Restricted TCP serial bridge to a running x86 xv6 guest."""

    HOST = "127.0.0.1"
    PORT = 5555
    TIMEOUT = 5.0
    MAX_RESPONSE = 65536
    PROMPT = b"$ "

    ALLOWED_FILES = {
        "report.txt": "report.txt",
        "important.txt": "important.txt",
        "inbox.txt": "inbox.txt",
    }

    MAX_EFFECT_DATA = 128

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

        if "\n" in command or "\r" in command:
            raise ValueError("Invalid command")

        try:
            self.sock.sendall(command.encode("ascii") + b"\n")
            output = self._read_until_prompt()

            lines = output.replace("\r", "").splitlines()

            if lines and lines[0].strip() == command:
                lines = lines[1:]

            return "\n".join(lines).strip()

        except (OSError, TimeoutError, RuntimeError):
            self.close()
            raise

    def _validate_path(self, path):
        if not isinstance(path, str):
            raise ValueError("Path must be a string")

        if "\x00" in path or "\\" in path or ".." in path:
            raise ValueError("Invalid file path")

        normalized = path.lstrip("/")

        if normalized not in self.ALLOWED_FILES:
            raise ValueError("File path is not allowed")

        return self.ALLOWED_FILES[normalized]

    def _execute_effect(self, key, op, path, data):
        if not isinstance(key, int) or isinstance(key, bool):
            raise ValueError("Effect key must be an integer")

        if key <= 0 or key > 0xFFFFFFFFFFFFFFFF:
            raise ValueError("Effect key must be a non-zero 64-bit integer")

        if not isinstance(op, str):
            raise ValueError("Effect operation must be a string")

        op = op.upper()

        if op not in ("CREATE", "APPEND"):
            raise ValueError("Operation must be CREATE or APPEND")

        filename = self._validate_path(path)

        if not isinstance(data, str):
            raise ValueError("Effect data must be a string")

        data_bytes = data.encode("utf-8")

        if op == "CREATE":
            if data_bytes:
                raise ValueError("CREATE does not accept data")
            hex_data = "-"

        else:
            if not data_bytes:
                raise ValueError("APPEND data cannot be empty")

            if len(data_bytes) > self.MAX_EFFECT_DATA:
                raise ValueError("APPEND data exceeds 128 bytes")

            # Hex encoding prevents spaces or special characters
            # in the payload from being interpreted by xv6 shell.
            hex_data = data_bytes.hex()

        command = (
            f"effectctl {key} {op} {filename} {hex_data}"
        )

        return self._run_fixed_command(command)

    def execute(
        self,
        tool,
        path=None,
        n=None,
        key=None,
        op=None,
        data=None,
    ):
        with self.lock:
            if self.sock is None:
                self.connect()

            if tool == "list_files":
                if any(v is not None for v in (path, n, key, op, data)):
                    raise ValueError("list_files accepts no arguments")

                return self._run_fixed_command("ls")

            if tool == "read_file":
                filename = self._validate_path(path)
                return self._run_fixed_command("cat " + filename)

            if tool == "delete_file":
                filename = self._validate_path(path)
                return self._run_fixed_command("rm " + filename)

            if tool == "execute_effect":
                return self._execute_effect(
                    key=key,
                    op=op,
                    path=path,
                    data=data,
                )

            if tool == "set_crashat":
                if not isinstance(n, int) or isinstance(n, bool):
                    raise ValueError("Crash point must be an integer")

                if n < 0 or n > 100000:
                    raise ValueError(
                        "Crash point must be between 0 and 100000"
                    )

                command = "crashtest " + str(n)

                self.sock.sendall(command.encode("ascii") + b"\n")

                return self._read_until_prompt_or_panic()

            raise ValueError(f"Unsupported tool: {tool}")

    def _read_until_prompt_or_panic(self):
        deadline = time.monotonic() + max(self.timeout, 10.0)

        while time.monotonic() < deadline:
            data = bytes(self.buffer)

            if b"panic:" in data:
                self.buffer.clear()
                return data.decode("utf-8", errors="replace")

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
            except socket.timeout:
                continue

            if not chunk:
                raise RuntimeError("QEMU closed the serial connection")

            self.buffer.extend(chunk)

        raise TimeoutError("Timed out waiting for crash-test result")
