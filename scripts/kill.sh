#!/usr/bin/env fish
echo "Killing processes on port 3001-3004"
kill (lsof -ti:3001,3002,3003,3004) &> /dev/null
