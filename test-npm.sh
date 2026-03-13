#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

if [ "${1:-}" != "dev" ] && [ "${1:-}" != "ssr" ]; then
    p=$(basename "$0")
    echo "Usage: $p <dev|ssr>" >&2
    exit 1
fi

./scripts/upgrade-npm.sh
./scripts/run.sh "$@"
