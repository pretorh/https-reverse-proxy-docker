#!/usr/bin/env sh

echo "This seems to be the first run, or you are missing the ssl certificates"
echo "make sure $(pwd)/private is mounted"
echo "to create the certificates, run:"
id=$(grep 'docker' /proc/self/cgroup | sed 's/^.*\///' | tail -n1)
echo "  docker exec $id sh ./setup/issue.sh <domain>"
echo "  docker exec $id sh ./install-cert.sh <domain>"
