#!/usr/bin/env sh
set -e

start_file="$(mktemp)"
log_prefix=$(basename "$0")

updated=0
if sh /opt/rproxy/renew-certs.sh ; then
  echo "$log_prefix: renew script successful"
  if find /etc/ssl/acme/ -type f -name 'private-key.pem' -newer "$start_file" | grep '^' ; then
    echo "$log_prefix: some private key files were updated"
    updated=1
  else
    echo "$log_prefix: no private key files were updated"
  fi
else
  echo "$log_prefix: error renewing!" >&2
  updated=-1
fi

if [ $updated -eq 1 ] ; then
  echo "$log_prefix: certificates renewed, reloading"
  /opt/rproxy/reload-nginx.sh
fi

if [ -x /opt/rproxy/private/post-cron.sh ] ; then
  echo "$log_prefix: executing post-cron.sh script with updated=$updated"
  /opt/rproxy/private/post-cron.sh $updated
else
  echo "$log_prefix: no post-cron.sh script"
fi
