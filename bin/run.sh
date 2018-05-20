if [ ! -f ./private/dhparam.pem ] ; then
  sh $(dirname $0)/generate-dhparam.sh
fi

echo "starting nginx"
nginx -g 'daemon off;'
