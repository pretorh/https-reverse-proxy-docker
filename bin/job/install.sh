set -e

echo "installing cron job for $CRON_DAY dow, $CRON_HOUR hour"

min=$(date '+%M')
cmd=$(pwd)/job/renew-job.sh
echo "$min $CRON_HOUR * * $CRON_DAY $cmd" | crontab -
crontab -l
crond -L /var/cron.log -l 0
