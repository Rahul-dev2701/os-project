#!/bin/bash

set -Eeuo pipefail

# --------------------------------------------------
# Project paths
# --------------------------------------------------

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

XV6_DIR="$ROOT/xv6-public"
PYTHON_SCRIPT="$ROOT/scripts/crash_replay.py"

TMP_DIR="$(mktemp -d)"

HAD_FS=0
HAD_XV6=0

# --------------------------------------------------
# Validate project files
# --------------------------------------------------

if [ ! -d "$XV6_DIR" ]; then
    echo "[ERROR] xv6-public directory not found."
    exit 1
fi

if [ ! -f "$XV6_DIR/Makefile" ]; then
    echo "[ERROR] Makefile not found."
    exit 1
fi

if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "[ERROR] crash_replay.py not found."
    exit 1
fi

# --------------------------------------------------
# Backup original images
# --------------------------------------------------

echo "[*] Backing up original images..."

if [ -f "$XV6_DIR/fs.img" ]; then
    cp "$XV6_DIR/fs.img" "$TMP_DIR/fs.img"
    HAD_FS=1
fi

if [ -f "$XV6_DIR/xv6.img" ]; then
    cp "$XV6_DIR/xv6.img" "$TMP_DIR/xv6.img"
    HAD_XV6=1
fi

# --------------------------------------------------
# Cleanup and restore images
# --------------------------------------------------

cleanup() {

    STATUS=$?

    trap - EXIT INT TERM

    echo
    echo "=========================================="
    echo " RESTORING ORIGINAL PROJECT IMAGES"
    echo "=========================================="

    if [ "$HAD_FS" -eq 1 ]; then
        cp "$TMP_DIR/fs.img" "$XV6_DIR/fs.img"
        echo "[+] Original fs.img restored."
    else
        rm -f "$XV6_DIR/fs.img"
        echo "[+] Generated fs.img removed."
    fi

    if [ "$HAD_XV6" -eq 1 ]; then
        cp "$TMP_DIR/xv6.img" "$XV6_DIR/xv6.img"
        echo "[+] Original xv6.img restored."
    else
        rm -f "$XV6_DIR/xv6.img"
        echo "[+] Generated xv6.img removed."
    fi

    rm -rf "$TMP_DIR"

    if [ "$STATUS" -eq 0 ]; then
        echo "[+] Test completed successfully."
    else
        echo "[!] Test failed with exit status $STATUS."
    fi

    exit "$STATUS"
}

trap cleanup EXIT

# --------------------------------------------------
# STEP 1: Clean previous build
# --------------------------------------------------

echo
echo "=========================================="
echo " xv6 EXACTLY-ONCE CRASH/REPLAY TEST"
echo "=========================================="

echo
echo "[1/4] Cleaning previous build..."

make -C "$XV6_DIR" clean

# --------------------------------------------------
# STEP 2: Build xv6 kernel and filesystem
# --------------------------------------------------

echo
echo "[2/4] Building xv6 kernel and filesystem..."

make -C "$XV6_DIR" xv6.img fs.img

if [ ! -s "$XV6_DIR/xv6.img" ]; then
    echo "[ERROR] xv6.img was not generated."
    exit 1
fi

if [ ! -s "$XV6_DIR/fs.img" ]; then
    echo "[ERROR] fs.img was not generated."
    exit 1
fi

echo "[+] xv6.img generated successfully."
echo "[+] fs.img generated successfully."

# --------------------------------------------------
# STEP 3: Save baseline filesystem
# --------------------------------------------------

echo
echo "[3/4] Saving baseline filesystem..."

BASELINE="$TMP_DIR/baseline.img"

cp "$XV6_DIR/fs.img" "$BASELINE"

if [ ! -s "$BASELINE" ]; then
    echo "[ERROR] Baseline filesystem is empty."
    exit 1
fi

echo "[+] Baseline filesystem saved."

ls -lh "$BASELINE"

# --------------------------------------------------
# STEP 4: Run Python crash/replay test
# --------------------------------------------------

echo
echo "[4/4] Running crash/replay test..."

echo "[DEBUG] Python script: $PYTHON_SCRIPT"
echo "[DEBUG] Baseline: $BASELINE"

if [ ! -f "$BASELINE" ]; then
    echo "[ERROR] Baseline image does not exist."
    exit 1
fi

if [ ! -r "$BASELINE" ]; then
    echo "[ERROR] Baseline image is not readable."
    exit 1
fi

python3 -u "$PYTHON_SCRIPT" --baseline "$BASELINE"

# --------------------------------------------------
# FINISHED
# --------------------------------------------------

echo
echo "=========================================="
echo " CRASH/REPLAY TEST FINISHED"
echo "=========================================="
