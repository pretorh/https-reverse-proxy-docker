if [ ! -d  ./private/acme ] ; then
  sh $(dirname $0)/utils/first-run-note.sh
  mkdir -pv ./private/acme
fi

if [ ! -f ./private/dhparam.pem ] ; then
  sh $(dirname $0)/generate-dhparam.sh
fi

echo "starting nginx"
nginx -g 'daemon off;'
