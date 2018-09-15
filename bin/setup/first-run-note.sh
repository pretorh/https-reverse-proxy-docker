echo "This seems to be the first run, or you are missing the ssl certificates"
echo "make sure $(pwd)/private is mounted"
echo "to create the certificates, run:"
id=$(cat /proc/self/cgroup | grep 'docker' | sed 's/^.*\///' | tail -n1)
echo "  docker exec $id sh ./lets-encrypt.sh ..."
