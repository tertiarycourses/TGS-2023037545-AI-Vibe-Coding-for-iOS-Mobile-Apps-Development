#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
command -v xcodegen >/dev/null || { echo "Install XcodeGen before continuing." >&2; exit 2; }
xcodegen generate --spec project.yml
