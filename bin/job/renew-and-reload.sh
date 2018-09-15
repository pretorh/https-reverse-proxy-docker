#!/usr/bin/env sh
set -e

cd $(dirname $0)/..
sh ./renew-certs.sh || (echo "up to date"; exit 0)
./reload-nginx.sh
