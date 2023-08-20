#!/usr/bin/env sh
set -e

domain=${1?need the domain name as the first parameter}

mkdir -pv "/etc/ssl/acme/$domain/"

reloadcmd=true
if [ "$RELOAD_AFTER" ] ; then
  reloadcmd=/opt/rproxy/reload-nginx.sh
fi

echo "rproxy: installing cert for $domain"
acme.sh --install-cert -d "$domain" \
  --key-file "/etc/ssl/acme/$domain/private-key.pem" \
  --fullchain-file "/etc/ssl/acme/$domain/fullchain.pem" \
  --reloadcmd "$reloadcmd"
