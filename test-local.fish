#!/usr/bin/env fish

git submodule update --init

if test "$argv[1]" != "dev" -a "$argv[1]" != "ssr"
    set p (basename (status -f))
    echo "Usage: $p [dev|ssr] <branch>"
    exit 1
end

cd (dirname (status --current-filename))
./scripts/upgrade-local.sh $argv
./scripts/build.sh
./scripts/run.sh $argv
