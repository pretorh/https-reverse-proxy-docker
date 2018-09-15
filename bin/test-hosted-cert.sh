HOST=${1-localhost}

# based on https://serverfault.com/a/661982
# but only print some of the info
echo \
  | openssl s_client -showcerts -servername $HOST -connect $HOST:443 2>/dev/null \
  | openssl x509 -inform pem -noout -subject -issuer -email -dates -fingerprint
