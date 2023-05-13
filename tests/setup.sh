#!/usr/bin/env bash
set -e

image_tag=${1?'need the image tag as first argument'}
test_domain=${2?'need the domain to test for as the 2nd argument'}
http_port=${HTTP_PORT-80}
https_port=${HTTPS_PORT-443}

root_test_dir=./hrp-tests

full_image_name="pretorh/https-reverse-proxy:$image_tag"
port_map_http="$http_port:80"
port_map_https="$https_port:443"

config_file() {
  file=$1
  example="examples/$file"
  output="$root_test_dir/$file"
  mkdir -p "$(dirname "$output")"

  echo "$example -> sed -> $output"
  sed \
    -e 's|pretorh/https-reverse-proxy:latest|'"$full_image_name"'|' \
    -e 's|80:80|'"$port_map_http"'|' \
    -e 's|443:443|'"$port_map_https"'|' \
    -e 's|domain-setup.sh .*|domain-setup.sh '"$test_domain"'|g' \
    -e 's|combined.domain1.example.com|'"$test_domain"'|g' \
    -e 's|# research before using/cherry-pick from: ||g' \
    "$example" > "$output"
}

echo "Configuring examples for testing:"
echo "- using $full_image_name on ports $port_map_http and $port_map_https"
echo "- domain: $test_domain"
echo "- test directory: $root_test_dir"

mkdir -p $root_test_dir/{sites/,public/web-and-api/}
cp -v examples/public/web-and-api/index.html $root_test_dir/public/web-and-api/
config_file issue-certificates.sh
config_file docker-compose.yml
config_file sites/combined.conf
