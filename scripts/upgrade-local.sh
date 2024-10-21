#!/usr/bin/env fish

cd (dirname (status --current-filename))
source common.sh

echo "Fetching react-activity-calendar..."
git submodule update --init > /dev/null;
  and cd ../react-activity-calendar &> /dev/null;
  and git checkout main &> /dev/null;
  and git pull > /dev/null;
  and cd -;
  or abort "failed fetching"

