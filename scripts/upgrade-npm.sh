#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

echo "Upgrading npm package"
cd ../frameworks || exit 1
for p in */package.json; do
  (
    framework=$(dirname "$p")
    cd "$framework" || abort "cd"
    pnpm --loglevel=error upgrade --latest react-activity-calendar > /dev/null || abort "upgrading failed"
    v=$(awk -F'"' '/"react-activity-calendar"/ {print $4}' package.json)
    echo "$framework - @$v"
  ) || abort "upgrading failed"
done
