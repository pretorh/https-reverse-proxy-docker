#!/usr/bin/env sh

file=${1-'./private/dhparam.pem'}

echo "generating dhparam file $file"
mkdir -pv "$(dirname "$file")"
openssl dhparam -dsaparam -out "$file" 4096
echo "generated"
