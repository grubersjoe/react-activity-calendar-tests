#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
source ./common.sh

branch="main"
if [[ -n "${2-}" ]]; then
  branch="$2"
fi

echo "Fetching react-activity-calendar..."
git submodule update --init > /dev/null
pushd ../react-activity-calendar > /dev/null || abort "failed fetching"
git checkout "$branch" > /dev/null
git pull > /dev/null
popd > /dev/null || abort "failed fetching"