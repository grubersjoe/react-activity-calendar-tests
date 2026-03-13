#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
source common.sh

echo "Killing processes on port 3001-3004"
k=$(lsof -ti:"3001,3002,3003,3004" || true)
if [ -n "$k" ]; then
  kill $k
fi

cd ../frameworks || exit 1
for p in */package.json; do
  (
    framework=$(dirname "$p")
    cd "$framework" || abort "cd"
    pnpm --loglevel=error i --ignore-scripts > /dev/null || abort "installing packages failed"
    nohup pnpm --loglevel=error run "$1-test" > /dev/null 2>&1 &
    echo "Starting $framework (pid $!)..."
 ) || abort "starting failed"
done

echo "Waiting for servers to start..."
for port in {3001..3004}; do
    if curl -s -f \
        --retry 10 \
        --retry-delay 1 \
        --retry-connrefused \
        --max-time 2 \
        "http://localhost:$port" > /dev/null; then
      open "http://localhost:$port"
    else
      abort ":$port not responding, aborting"
    fi
done
