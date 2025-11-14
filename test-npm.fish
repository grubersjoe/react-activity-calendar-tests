#!/usr/bin/env bash
set -euo pipefail

if [[ "${1-}" != "dev" && "${1-}" != "ssr" ]]; then
  p="$(basename "$0")"
  echo "Usage: $p [dev|ssr]"
  exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")"
./scripts/upgrade-npm.sh
./scripts/run.sh "$@"