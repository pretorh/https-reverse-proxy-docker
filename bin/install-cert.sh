#!/usr/bin/env sh
set -e

domain=${1?need the domain name as the first parameter}

mkdir -pv "/etc/ssl/acme/$domain/"
mkdir -pv "/etc/ssl/acme/private/$domain/"

echo "rproxy: installing cert for $domain"
acme.sh --install-cert -d "$domain" \
  --key-file "/etc/ssl/acme/private/$domain/privkey.pem" \
  --fullchain-file "/etc/ssl/acme/$domain/fullchain.pem" \
  --reloadcmd /opt/rproxy/reload-nginx.sh
