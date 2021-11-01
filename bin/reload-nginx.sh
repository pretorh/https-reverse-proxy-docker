#!/usr/bin/env sh
set -e

nginx -t
nginx -s reload
