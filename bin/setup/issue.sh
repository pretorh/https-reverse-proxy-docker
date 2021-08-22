#!/usr/bin/env sh
set -e

domain=${1?need the domain name as the first parameter}

echo "rproxy: issuing for $domain"
acme.sh --issue -d "'$domain'" --server Letsencrypt.org -w /var/www/acme/ --log
