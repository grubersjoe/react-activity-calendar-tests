#!/usr/bin/env bash
set -euo pipefail

git submodule update --init

if [[ "${1-}" != "dev" && "${1-}" != "ssr" ]]; then
  p="$(basename "$0")"
  echo "Usage: $p [dev|ssr] <branch>"
  exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")"
./scripts/upgrade-local.sh "$@"
./scripts/build.sh
./scripts/run.sh "$@"