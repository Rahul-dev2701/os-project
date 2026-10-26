# OS Project

Exactly-once filesystem syscall and crash recovery using x86 xv6-public.

## Repository Structure

- xv6-public/: xv6 operating system source
- tests/: correctness and crash-recovery tests
- scripts/: build and test automation
- docs/: design and implementation documentation
- agent/: optional Python agent and QEMU bridge

## Build and Run

    cd xv6-public
    make
    make qemu-nox
