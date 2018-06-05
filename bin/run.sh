if [ ! -d  ./private/acme ] ; then
  sh $(dirname $0)/utils/first-run-note.sh
  mkdir -pv ./private/acme
fi

if [ ! -f ./private/dhparam.pem ] ; then
  sh $(dirname $0)/generate-dhparam.sh
fi

if [ ! -d /etc/nginx/conf.d/sites/ ] ; then
 echo "creating sym link from mounted sites to nginx dir"
 mkdir -pv ./private/sites
 ln -sv $(pwd)/private/sites /etc/nginx/conf.d/sites
fi

echo ""
echo "starting nginx"
nginx -g 'daemon off;'
