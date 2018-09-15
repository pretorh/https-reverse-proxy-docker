#!/usr/bin/env sh
set -e

cd $(dirname $0)/..
updated=0
if sh ./renew-certs.sh ; then
  echo "reloading"
  ./reload-nginx.sh
  updated=1
else
  echo "up to date"
fi

[ -x ./private/post-cron.sh ] && ./private/post-cron.sh $updated
