#!/usr/bin/env sh
set -e

echo "installing cron job for $CRON_DAY dow, $CRON_HOUR hour"

min=$(date '+%M')
cmd=$(pwd)/job/renew-and-reload.sh
mkdir -pv /var/log/rproxy/
echo "$min $CRON_HOUR * * $CRON_DAY $cmd >> /var/log/rproxy/renew-and-reload-job.log 2>&1" | crontab -
crontab -l
crond -L /var/cron.log -l 0
