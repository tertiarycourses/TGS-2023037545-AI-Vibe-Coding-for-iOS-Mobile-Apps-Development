#!/bin/sh
set -eu
echo "TRAINER DEMO / FUTURE CREDENTIALLED GATE"
: "${APP_PROJECT:?Set APP_PROJECT to the reviewed .xcodeproj path}"
: "${APP_SCHEME:?Set APP_SCHEME to the reviewed shared scheme}"
: "${ARCHIVE_PATH:?Set ARCHIVE_PATH to a safe explicit .xcarchive path}"
case "$ARCHIVE_PATH" in /|"$HOME"|"$HOME"/*) echo "Choose a task-specific archive path outside the home root." >&2; exit 2;; esac
xcodebuild -project "$APP_PROJECT" -scheme "$APP_SCHEME" -configuration Release -destination 'generic/platform=iOS' -archivePath "$ARCHIVE_PATH" archive
echo "Archive created. Validate it in Xcode Organizer before export. This script does not upload or submit."
