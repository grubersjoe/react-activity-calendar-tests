#!/usr/bin/env fish

cd (dirname (status --current-filename))
source common.sh

./kill.sh

set -l pids
cd ../frameworks
for p in */package.json
    set -l framework (dirname $p);
      and cd $framework; or abort "cd";
      and pnpm i --ignore-scripts > /dev/null; or abort "failed installing packages";
      and cp -r ../../react-activity-calendar/build node_modules/react-activity-calendar/; or abort "copying build artifacts failed";
      and pnpm run "$argv[1]-test" > /dev/null &

    set -l pid $last_pid
    set -a pids $pid;
      and echo "Starting $framework (pid $pid)...";
      and cd -;
      or abort "unknown"
end

set sleep 6
if test "$argv[1]" = "dev"
    set sleep 3
end

printf "Waiting %ss for servers to start...\n" $sleep
sleep $sleep

for pid in $pids;
  if not ps -p $pid > /dev/null
      abort "$pid not running"
  end
end

open http://localhost:3001
open http://localhost:3002
open http://localhost:3003
open http://localhost:3004
