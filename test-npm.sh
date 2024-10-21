#!/usr/bin/env fish

if test "$argv[1]" != "dev" -a "$argv[1]" != "ssr"
    set p (basename (status -f))
    echo "Usage: $p [dev|ssr]"
    exit 1
end

cd (dirname (status --current-filename))
./scripts/upgrade-npm.sh
./scripts/run.sh $argv
