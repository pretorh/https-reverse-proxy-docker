#!/usr/bin/env sh
set -e

start_file="$(mktemp)"

updated=0
if sh /opt/rproxy/renew-certs.sh ; then
  echo "update job successful"
  if find /etc/ssl/acme/ -type f -name 'private-key.pem' -newer "$start_file" | grep '^' ; then
    updated=1
  fi
else
  echo "error renewing!" >&2
  updated=-1
fi

if [ $updated -eq 1 ] ; then
  echo "certificates renewed, reloading"
  /opt/rproxy/reload-nginx.sh
fi

if [ -x /opt/rproxy/private/post-cron.sh ] ; then
  echo "executing post-cron.sh script"
  /opt/rproxy/private/post-cron.sh $updated
else
  echo "no post-cron.sh script"
fi
