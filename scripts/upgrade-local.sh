#!/usr/bin/env bash
set -eo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

branch="main"
if [ -n "$2" ]; then
   branch="$2"
fi

echo "Fetching react-activity-calendar:$branch..."
git submodule update -q --init && \
  cd ../react-activity-calendar && \
  git checkout -q "$branch" && \
  git pull -q && \
  cd - > /dev/null || abort "fetching failed"
