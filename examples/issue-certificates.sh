#!/usr/bin/env bash
set -e

# example command for issuing certificates, for the domains used in sites/*.conf
docker run --rm -ti \
    -p 80:80 \
    -v "$(pwd)/.private":/opt/rproxy/private \
    pretorh/https-reverse-proxy:latest \
    ./domain-setup.sh simple.domain1.example.com web.domain1.example.com combined.domain1.example.com
