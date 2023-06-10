#!/usr/bin/env sh

root=$(dirname "$0")

if [ ! -d  ./private/certs ] ; then
  sh "$root/setup/first-run-note.sh"
  mkdir -pv ./private/certs
fi

mkdir -pv ./private/acme.sh

if [ ! -f ./private/dhparam.pem ] ; then
  sh "$root/setup/generate-dhparam.sh"
fi

if [ ! -d /etc/nginx/conf.d/sites/ ] ; then
  echo "creating sym link from mounted sites to nginx dir"
  mkdir -pv ./private/sites
  ln -sv "$(pwd)"/private/sites /etc/nginx/conf.d/sites
fi

if [ -n "$CRON_DAY" ] && [ -n "$CRON_HOUR" ] ; then
  sh "$root/job/install.sh"
fi

echo ""
echo "starting nginx"
nginx -g 'daemon off;'
