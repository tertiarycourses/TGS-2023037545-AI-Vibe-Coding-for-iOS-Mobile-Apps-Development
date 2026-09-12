#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
echo "LOCAL PREFLIGHT ONLY - no upload or App Store Connect mutation"
xcodegen --version
xcrun simctl list devices available | grep 'iPhone' | head -5
test -f solution/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png
test -f solution/PrivacyInfo.xcprivacy
sips -g pixelWidth -g pixelHeight -g hasAlpha solution/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png
plutil -lint solution/PrivacyInfo.xcprivacy
./scripts/build-simulator.sh
./scripts/test.sh
echo "Local preflight complete. Signing, archive, upload and submission remain HOLD."
