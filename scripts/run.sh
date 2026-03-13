#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

echo "Killing processes on port 3001-3004"
k=$(lsof -ti:"3001,3002,3003,3004" || true)
if [ -n "$k" ]; then
  kill $k
fi

pids=()
cd ../frameworks || exit 1
for p in */package.json; do
    framework=$(dirname "$p")
    cd "$framework" || abort "cd"
    pnpm --loglevel=error i --ignore-scripts > /dev/null || abort "failed installing packages"
    pnpm --loglevel=error run "$1-test" > /dev/null &

    pid=$!
    pids+=("$pid")
    echo "Starting $framework (pid $pid)..."
    cd - > /dev/null || abort "unknown"
done

sleep=6
if [ "$1" = "dev" ]; then
    sleep=3
fi

printf "Waiting %ss for servers to start...\n" $sleep
sleep $sleep

for pid in "${pids[@]}"; do
    if ! ps -p $pid > /dev/null; then
        abort "$pid not running"
    fi
done

open http://localhost:3001
open http://localhost:3002
open http://localhost:3003
open http://localhost:3004
