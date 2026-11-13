#!/usr/bin/env python3

import argparse
import os
import shutil
import signal
import socket
import subprocess
import sys
import time
from pathlib import Path

# --------------------------------------------------
# Project configuration
# --------------------------------------------------

HOST = "127.0.0.1"
PORT = 5555

PROMPT = b"$ "

PANIC_MARKERS = (
    b"panic:",
    b"crashat: injected crash",
)

ROOT = Path(__file__).resolve().parents[1]
XV6_DIR = ROOT / "xv6-public"


# --------------------------------------------------
# QEMU Guest
# --------------------------------------------------

class QemuGuest:

    def __init__(self):
        self.process = None
        self.sock = None

    # --------------------------------------------------
    # Start QEMU
    # --------------------------------------------------

    def start(self):

        self.stop()

        print("[*] Starting xv6 QEMU guest...", flush=True)

        self.process = subprocess.Popen(
            ["make", "qemu-agent"],
            cwd=XV6_DIR,
            stdout=None,
            stderr=None,
            start_new_session=True,
        )

        deadline = time.time() + 30

        while time.time() < deadline:

            if self.process.poll() is not None:
                raise RuntimeError(
                    "QEMU exited before serial connection "
                    "was established."
                )

            try:

                self.sock = socket.create_connection(
                    (HOST, PORT),
                    timeout=2,
                )

                print(
                    "[+] Connected to QEMU serial port.",
                    flush=True
                )

                self.sock.settimeout(1)

                output = self.read_until_prompt(timeout=25)

                if PROMPT not in output:
                    raise RuntimeError(
                        "xv6 shell prompt was not received.\n"
                        + output.decode(errors="replace")
                    )

                print("[+] xv6 shell is ready.", flush=True)

                return

            except (OSError, TimeoutError):

                if self.sock:
                    self.sock.close()
                    self.sock = None

                time.sleep(0.5)

        self.stop()

        raise RuntimeError(
            f"Could not connect to QEMU at {HOST}:{PORT}"
        )

    # --------------------------------------------------
    # Read serial output
    # --------------------------------------------------

    def read_until_prompt(self, timeout=15):

        data = bytearray()

        deadline = time.time() + timeout

        while time.time() < deadline:

            if self.process and self.process.poll() is not None:
                break

            try:

                chunk = self.sock.recv(4096)

                if not chunk:
                    break

                data.extend(chunk)

                lower = data.lower()

                if any(
                    marker in lower
                    for marker in PANIC_MARKERS
                ):
                    break

                if PROMPT in data:
                    break

            except socket.timeout:
                continue

            except OSError:
                break

        return bytes(data)

    # --------------------------------------------------
    # Execute xv6 command
    # --------------------------------------------------

    def command(self, command, timeout=20):

        if not self.sock:
            raise RuntimeError(
                "QEMU serial connection unavailable."
            )

        print(f"\n[COMMAND] {command}", flush=True)

        self.sock.sendall(command.encode() + b"\n")

        output = self.read_until_prompt(timeout)

        decoded = output.decode(errors="replace")

        print(decoded, end="", flush=True)

        if not output:
            raise RuntimeError(
                "No response received from xv6."
            )

        return decoded

    # --------------------------------------------------
    # Stop QEMU
    # --------------------------------------------------

    def stop(self):

        if self.sock:

            try:
                self.sock.close()
            except OSError:
                pass

            self.sock = None

        if self.process and self.process.poll() is None:

            print("[*] Stopping QEMU...", flush=True)

            try:

                os.killpg(
                    os.getpgid(self.process.pid),
                    signal.SIGTERM,
                )

                self.process.wait(timeout=5)

            except (ProcessLookupError, subprocess.TimeoutExpired):

                try:

                    os.killpg(
                        os.getpgid(self.process.pid),
                        signal.SIGKILL,
                    )

                except ProcessLookupError:
                    pass

                self.process.wait()

        self.process = None


# --------------------------------------------------
# Crash detection
# --------------------------------------------------

def guest_crashed(output):

    text = output.lower()

    return any(
        marker.decode() in text
        for marker in PANIC_MARKERS
    )


# --------------------------------------------------
# Prompt detection
# --------------------------------------------------

def prompt_received(output):

    return PROMPT.decode() in output


# --------------------------------------------------
# Exactly-once verification
# --------------------------------------------------

def verify_once(output):

    count = output.count("HELLO")

    print("\n[VERIFY] HELLO occurrences:", count)

    if count == 1:

        print("[PASS] HELLO appears exactly once.")

        return True

    print("[FAIL] Expected HELLO exactly once.")

    print("[FAIL] Actual occurrences:", count)

    return False


# --------------------------------------------------
# One complete crash/reboot/replay trial
# --------------------------------------------------

def run_trial(baseline):

    print("\n========================================")
    print(" xv6 EXACTLY-ONCE CRASH/REPLAY TEST")
    print("========================================")

    # Restore clean baseline.

    print("\n[*] Restoring baseline filesystem...")

    shutil.copy2(
        baseline,
        XV6_DIR / "fs.img"
    )

    guest = QemuGuest()

    try:

        # STEP 1: Start xv6.

        guest.start()

        # STEP 2: Setup.

        print("\n[STEP 1] Preparing test...")

        setup_output = guest.command(
            "effectcrash setup"
        )

        if guest_crashed(setup_output):
            raise RuntimeError(
                "Guest crashed during setup."
            )

        if not prompt_received(setup_output):
            raise RuntimeError(
                "Setup did not return to xv6 prompt."
            )

        # STEP 3: Trigger crash.

        print("\n[STEP 2] Triggering crash...")

        write_output = guest.command(
            "effectcrash write",
            timeout=25
        )

        if not guest_crashed(write_output):
            raise RuntimeError(
                "Expected crashat panic was not detected."
            )

        print("\n[+] Expected crash detected.")

        # STEP 4: Stop crashed guest.

        guest.stop()

        # STEP 5: Reboot using same filesystem.

        print("\n[STEP 3] Rebooting xv6...")

        guest.start()

        # STEP 6: Replay.

        print("\n[STEP 4] Replaying request...")

        replay_output = guest.command(
            "effectcrash replay",
            timeout=25
        )

        if guest_crashed(replay_output):
            raise RuntimeError(
                "Guest crashed during replay."
            )

        if not prompt_received(replay_output):
            raise RuntimeError(
                "Replay did not return to xv6 prompt."
            )

        # STEP 7: Check file.

        print("\n[STEP 5] Checking file contents...")

        check_output = guest.command(
            "effectcrash check",
            timeout=25
        )

        if guest_crashed(check_output):
            raise RuntimeError(
                "Guest crashed during verification."
            )

        if not prompt_received(check_output):
            raise RuntimeError(
                "Check did not return to xv6 prompt."
            )

        # STEP 8: Verify exactly once.

        return verify_once(check_output)

    finally:

        guest.stop()


# --------------------------------------------------
# Argument parser
# --------------------------------------------------

def parse_arguments():

    parser = argparse.ArgumentParser(
        description=(
            "xv6 exactly-once crash/replay verification"
        )
    )

    parser.add_argument(
        "--baseline",
        type=Path,
        required=True,
        help="Path to the clean baseline fs.img"
    )

    return parser.parse_args()


# --------------------------------------------------
# Main
# --------------------------------------------------

def main():

    args = parse_arguments()

    baseline = args.baseline.resolve()

    print("[DEBUG] Baseline argument:", baseline)

    if not baseline.is_file():
        raise SystemExit(
            "[ERROR] Baseline filesystem image not found."
        )

    if baseline.stat().st_size == 0:
        raise SystemExit(
            "[ERROR] Baseline filesystem image is empty."
        )

    if not XV6_DIR.is_dir():
        raise SystemExit(
            "[ERROR] xv6-public directory not found."
        )

    if not (XV6_DIR / "Makefile").is_file():
        raise SystemExit(
            "[ERROR] xv6-public/Makefile not found."
        )

    try:

        passed = run_trial(baseline)

    except KeyboardInterrupt:

        print("\n[!] Test interrupted.")

        raise SystemExit(130)

    except Exception as error:

        print(f"\n[ERROR] {error}")

        passed = False

    print("\n========================================")
    print(" FINAL RESULT")
    print("========================================")

    if passed:

        print("[PASS] Original crash/replay test passed.")

        print("[PASS] HELLO appears exactly once.")

        return

    print("[FAIL] Crash/replay test failed.")

    sys.exit(1)


if __name__ == "__main__":
    main()
