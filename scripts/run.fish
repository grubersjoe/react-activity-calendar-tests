#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
source ./common.sh

./kill.sh

pids=()
pushd ../frameworks > /dev/null
for p in */package.json; do
  framework="$(dirname "$p")"
  pushd "$framework" > /dev/null || abort "cd"
  pnpm i --ignore-scripts > /dev/null || abort "failed installing packages"
  pnpm run "${1}-test" > /dev/null &
  pid=$!
  pids+=("$pid")
  echo "Starting $framework (pid $pid)..."
  popd > /dev/null || abort "unknown"
done
popd > /dev/null || abort "failed leaving frameworks"

sleep_secs=6
if [[ "${1-}" == "dev" ]]; then
  sleep_secs=3
fi

printf "Waiting %ss for servers to start...\n" "$sleep_secs"
sleep "$sleep_secs"

for pid in "${pids[@]}"; do
  if ! kill -0 "$pid" >/dev/null 2>&1; then
    abort "$pid not running"
  fi
done

open http://localhost:3001
open http://localhost:3002
open http://localhost:3003
open http://localhost:3004