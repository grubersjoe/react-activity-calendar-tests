#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
git submodule update --init

if [ "${1:-}" != "dev" ] && [ "${1:-}" != "ssr" ]; then
    p=$(basename "$0")
    echo "Usage: $p <dev|ssr> [branch]" >&2
    exit 1
fi

./scripts/upgrade-local.sh "$@"
./scripts/build.sh
./scripts/run.sh "$@"
