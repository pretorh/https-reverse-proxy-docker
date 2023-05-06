#!/usr/bin/env sh

domain=$1
connect=${2-localhost:443}

# based on https://serverfault.com/a/661982
# but only print some of the info
echo \
  | openssl s_client -showcerts -servername "$domain" -connect "$connect" 2>/dev/null \
  | openssl x509 -inform pem -noout -subject -issuer -email -dates -fingerprint
