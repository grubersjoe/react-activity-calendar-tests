#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
source ./common.sh

echo "Building react-activity-calendar...."
pushd ../react-activity-calendar > /dev/null
pnpm i --ignore-scripts > /dev/null
pnpm build &> || abort "building react-activity-calendar"
popd > /dev/null

pushd ../frameworks > /dev/null
for p in */package.json; do
  framework="$(dirname "$p")"
  pushd "$framework" > /dev/null
  cp -r ../../react-activity-calendar/build node_modules/react-activity-calendar/ || abort "copying build artifacts failed"
  popd > /dev/null
done
popd > /dev/null