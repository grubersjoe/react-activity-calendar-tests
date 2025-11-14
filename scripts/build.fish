#!/usr/bin/env fish

cd (dirname (status --current-filename))
source common.fish

echo "Building react-activity-calendar...."
cd ../react-activity-calendar;
  and pnpm i --ignore-scripts > /dev/null;
  and pnpm build &> /dev/null; or abort "Failed to build react-activity-calendar";
  and cd -;
  or abort "failed building"

cd ../frameworks
for p in */package.json
    set -l framework (dirname $p);
      and cd $framework; or abort "cd";
      and cp -r ../../react-activity-calendar/build node_modules/react-activity-calendar/; or abort "copying build artifacts failed";
      and cd -;
      or abort "unknown"
end
