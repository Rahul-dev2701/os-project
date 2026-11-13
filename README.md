# Exactly-Once Filesystem Effects in xv6

## 1. Project Overview

This project extends **xv6-public (x86)** with an idempotent filesystem operation designed to prevent duplicate file effects when a request is retried after a crash.

The implementation includes:

- `effect(key, op, path, buf, n)` system call.
- CREATE and APPEND operations.
- A persistent effect table stored in reserved filesystem blocks.
- Duplicate-key detection and stored-result handling.
- Crash injection using `crashat(n)`.
- Commit-stage crash checkpoints.
- User-space test programs.
- A Python bridge for communication with QEMU through TCP serial.

## 2. Directory Structure

```text
project/
│
├── README.md
├── xv6-public/
│   ├── Makefile
│   ├── log.c
│   ├── sysfile.c
│   ├── sysproc.c
│   ├── syscall.c
│   ├── syscall.h
│   ├── defs.h
│   ├── user.h
│   ├── usys.S
│   ├── effect.c
│   ├── fs.c
│   ├── fs.h
│   ├── mkfs.c
│   ├── proc.c
│   ├── effecttest.c
│   ├── effectcrash.c
│   ├── effectconcur.c
│   ├── effectinvalid.c
│   └── effectcapacity.c
│
├── agent/
│   ├── agent.py
│   ├── main.py
│   ├── hosted_client.py
│   ├── prompts.py
│   ├── qemu_bridge.py
│   ├── state.py
│   ├── tools.py
│   └── validator.py
│
├── scripts/
│   ├── crash_replay.py
│   └── crashat_probe.py
│
├── crash_test.sh
|
└── docs/
    └── REPORT.pdf
```

## 3. Requirements

- Linux or a Linux-compatible environment.
- GCC and Make.
- QEMU with x86 support.
- Python 3 for the bridge and agent components.

## 4. Build Instructions

Open a terminal in the project directory:

```bash
cd xv6-public
make
```

This builds the xv6 kernel, filesystem image and user programs listed in the Makefile.

## 5. Run xv6

For an interactive xv6 terminal:

```bash
make qemu-nox
```

Wait for the xv6 shell prompt.

## 6. Demonstrate the Effect Operations

Run the basic effect test:

```text
effecttest
```

This demonstrates CREATE, APPEND, duplicate requests and reuse of an existing key with a different request.

Run the additional tests:

```text
effectinvalid
effectconcur
effectcapacity
```

Their purposes are:

| Program | Demonstration |
|---|---|
| `effecttest` | Normal effects and duplicate requests |
| `effectinvalid` | Invalid inputs and operations |
| `effectconcur` | Concurrent effect requests |
| `effectcapacity` | Effect-table capacity handling |

The capacity test should be run on a fresh test filesystem because earlier tests may have consumed effect-table entries.

## 7. Demonstrate Crash and Replay

The crash test program provides four modes:

```text
effectcrash setup
effectcrash write
effectcrash replay
effectcrash check
```

Use this sequence:

1. Run `effectcrash setup` to prepare the test file.
2. Run `effectcrash write` to issue the test effect with crash injection enabled.
3. If xv6 panics, stop the QEMU instance.
4. Restart xv6 using the same filesystem image.
5. Run `effectcrash replay` with the same request key.
6. Run `effectcrash check` to inspect the file.

The expected behavior is that the test payload is not appended twice. The result depends on where the crash occurs, so this demonstration should not be presented as proof that every possible crash point has been tested.

**Important:** Do not rebuild, delete or replace `fs.img` between the crash and replay. The filesystem image must retain the disk state needed for recovery.

## 8. Run QEMU with the Python Bridge

To expose the xv6 serial console through TCP, run:

```bash
make qemu-agent
```

The configured connection is:

```text
Host: 127.0.0.1
Port: 5555
```

Keep QEMU running while using the Python bridge. The bridge communicates with the guest through this serial connection and supports the configured file and effect-related operations.

## 9. Crash Injection Probe

The repository includes a crash-injection probe:

```bash
python3 scripts/crashat_probe.py 1
```

The number selects the requested crash event. Use the probe with QEMU running in agent mode.

## 10. Important Notes

- Do not rebuild `fs.img` between crash and replay.
- Use the same key and payload when retrying a request.
- Run the capacity test on a fresh filesystem.
- A kernel panic during an intentional crash test is expected.
- A successful build or one successful crash test does not prove correctness at every crash point.

## 11. Project Status

The repository contains the main kernel implementation, persistent effect-table support, syscall integration, crash-injection code, user-space tests and QEMU bridge. Exhaustive automated crash-point testing and measured disk-write overhead remain areas for further verification.
