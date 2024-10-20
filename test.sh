#!/usr/bin/env fish

if test "$argv[1]" != "dev" -a "$argv[1]" != "ssr"
    set p (basename (status -f))
    echo "Usage: $p [dev|ssr]"
    exit 1
end


echo "Killing processes on port 3001,3002,3003,3004..."
source test_kill.sh

echo "Building react-activity-calendar..."
cd ../react-activity-calendar
git checkout main > /dev/null
p build > /dev/null
cd -

for p in */package.json
    set d (dirname $p)
    cd $d
    pnpm install --ignore-scripts > /dev/null
    cp ../../react-activity-calendar/build/* node_modules/react-activity-calendar/build/
    npm run $argv[1]-test > /dev/null &
    echo "[$d] pid $last_pid"
    cd -
end

sleep 5s
open http://localhost:3001
open http://localhost:3002
open http://localhost:3003
open http://localhost:3004

