#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

echo "Building react-activity-calendar..."
(
  cd ../react-activity-calendar || exit 1
  pnpm --loglevel=error i --ignore-scripts
  pnpm --loglevel=error build > /dev/null
) || abort "building failed"

cd ../frameworks || exit 1
for p in */package.json; do
  (
    framework=$(dirname "$p")
    cd "$framework" || abort "cd"
    cp -r ../../react-activity-calendar/build node_modules/react-activity-calendar/ || abort "copying build artifacts failed"
  ) || abort "copying failed"
done
