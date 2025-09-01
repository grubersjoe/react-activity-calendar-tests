#!/usr/bin/env fish

cd (dirname (status --current-filename))
source common.sh

echo "Upgrading npm package..."
cd ../frameworks
for p in */package.json
    set -l framework (dirname $p);
      and cd $framework; or abort "cd";
      and pnpm upgrade --latest react-activity-calendar > /dev/null; or abort "failed updating react-activity-calendar npm package";
      and set -l v (awk -F'"' '/"react-activity-calendar"/ {print $4}' package.json);
      and echo "$framework - @$v"
      and cd -;
end
