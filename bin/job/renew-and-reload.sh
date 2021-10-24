#!/usr/bin/env sh
set -e

start_file="$(mktemp)"

updated=0
if sh /opt/rproxy/renew-certs.sh ; then
  echo "update job successful"
  if find /opt/rproxy/private/acme/private -type f -name 'privkey.pem' -newer "$start_file" | grep '^' ; then
    updated=1
  fi
else
  echo "error renewing!" >&2
fi

[ -x ./private/post-cron.sh ] && ./private/post-cron.sh $updated
