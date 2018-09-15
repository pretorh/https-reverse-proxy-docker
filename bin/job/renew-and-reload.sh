#!/usr/bin/env sh
set -e

cd $(dirname $0)/..
if sh ./renew-certs.sh ; then
  echo "reloading"
  ./reload-nginx.sh
else
  echo "up to date"
fi
