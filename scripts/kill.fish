#!/usr/bin/env bash
set -euo pipefail

echo "Killing processes on port 3001-3004"
kill -9 $(lsof -ti:3001,3002,3003,3004) &> /dev/null
