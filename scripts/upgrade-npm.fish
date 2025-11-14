#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
source ./common.sh

echo "Upgrading npm package..."
pushd ../frameworks > /dev/null || abort "failed entering frameworks"
for p in */package.json; do
  framework="$(dirname "$p")"
  pushd "$framework" > /dev/null || abort "cd"
  pnpm upgrade --latest react-activity-calendar > /dev/null || abort "failed updating react-activity-calendar npm package"
  v="$(awk -F'"' '/"react-activity-calendar"/ {print $4}' package.json)"
  echo "$framework - @$v"
  popd > /dev/null
done
popd > /dev/null || abort "failed leaving frameworks"