#!/bin/sh
set -eu
ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"
if [ ! -d "Activity08Evidence.xcodeproj" ]; then xcodegen generate --spec project.yml; fi
DEVICE=${SIMULATOR_NAME:-}
if [ -z "$DEVICE" ] && xcrun simctl list devices available | grep -Fq "iPhone 17 Pro ("; then DEVICE="iPhone 17 Pro"; fi
if [ -z "$DEVICE" ]; then DEVICE=$(xcrun simctl list devices available | sed -n 's/^[[:space:]]*\(iPhone[^()]*(.*\) ([-A-F0-9]*).*/\1/p' | head -1 | sed 's/[[:space:]]*$//'); fi
if [ -z "$DEVICE" ]; then echo "No available iPhone Simulator was found." >&2; exit 2; fi
echo "Using iOS Simulator: $DEVICE"
xcodebuild -project "Activity08Evidence.xcodeproj" -scheme "Activity08Evidence" -destination "platform=iOS Simulator,name=$DEVICE" -derivedDataPath "${TMPDIR:-/tmp}/Activity08Evidence-DerivedData" CODE_SIGNING_ALLOWED=NO test
