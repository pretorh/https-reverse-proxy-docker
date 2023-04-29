#!/usr/bin/env sh
set -e

echo "Starting nginx (daemon)"
nginx

echo "Set up directories"
mkdir -pv ./private/acme.sh
mkdir -pv ./private/acme

echo "Issuing certificates"
for domain in "$@" ; do
  ./setup/issue.sh "$domain" || true # ignore re-issue failures
  ./install-cert.sh "$domain"
done
