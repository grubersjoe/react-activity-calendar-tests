#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

branch="${2:-main}"

echo "Fetching react-activity-calendar:$branch..."
(
  git submodule update -q --init && \
  cd ../react-activity-calendar && \
  git checkout -q "$branch" && \
  git pull -q
)|| abort "fetching failed"
