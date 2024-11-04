#!/usr/bin/env fish

cd (dirname (status --current-filename))
source common.sh

echo "Building react-activity-calendar...."
cd ../react-activity-calendar;
  and pnpm i --ignore-scripts > /dev/null;
  and pnpm build &> /dev/null; or abort "Failed to build react-activity-calendar";
  and cd -;
  or abort "failed building"
