#!/usr/bin/env fish

cd (dirname (status --current-filename))
source common.sh

set branch "main"
if test -n "$argv[2]"
   set branch "$argv[2]"
end

echo "Fetching react-activity-calendar..."
git submodule update --init > /dev/null;
  and cd ../react-activity-calendar &> /dev/null;
  and git checkout $branch > /dev/null;
  and git pull > /dev/null;
  and cd -;
  or abort "failed fetching"

