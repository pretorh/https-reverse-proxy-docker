#!/usr/bin/env sh

if [ ! -d  ./private/acme ] ; then
  sh $(dirname $0)/setup/first-run-note.sh
  mkdir -pv ./private/acme
fi

mkdir -pv ./private/acme.sh

if [ ! -f ./private/dhparam.pem ] ; then
  sh $(dirname $0)/setup/generate-dhparam.sh
fi

if [ ! -d /etc/nginx/conf.d/sites/ ] ; then
  echo "creating sym link from mounted sites to nginx dir"
  mkdir -pv ./private/sites
  ln -sv $(pwd)/private/sites /etc/nginx/conf.d/sites
fi

if [ ! -z "$CRON_DAY" -a ! -z "$CRON_HOUR" ] ; then
  sh $(dirname $0)/job/install.sh
fi

echo ""
echo "starting nginx"
nginx -g 'daemon off;'
