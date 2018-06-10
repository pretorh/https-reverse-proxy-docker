#! /usr/bin/env sh
set -e

TAG=${1-latest}
docker build -t pretorh/https-reverse-proxy:$TAG .
