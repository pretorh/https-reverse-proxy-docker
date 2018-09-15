renewed=0

for d in $(ls -1 ./private/acme | grep -v private) ; do
  echo $d
  sh ./lets-encrypt.sh $d && renewed=1
done

if [ "$renewed" -eq 1 ] ; then
  echo "certificates were renewed"
  exit 0
fi
exit 1
