#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

echo "Upgrading react-activity-calendar package"
pnpm --loglevel=error upgrade react-activity-calendar || abort "upgrading failed"