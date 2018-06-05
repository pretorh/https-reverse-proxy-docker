for d in $(ls -1 ./private/acme | grep -v private) ; do
  echo $d
  sh ./lets-encrypt.sh $d
done
