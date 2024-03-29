# based on https://cipherlist.eu/ and https://ssl-config.mozilla.org

ssl_protocols               TLSv1.3;
ssl_prefer_server_ciphers   on;
ssl_dhparam                 /opt/rproxy/private/dhparam.pem;
ssl_ciphers                 ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
ssl_ecdh_curve              secp384r1;
ssl_session_timeout         10m;
ssl_session_cache           shared:SSL:10m;
ssl_session_tickets         off;
ssl_stapling                on;
ssl_stapling_verify         on;

resolver                    8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout            5s;

add_header                  Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
add_header                  X-Frame-Options DENY;
add_header                  X-Content-Type-Options nosniff;
add_header                  X-XSS-Protection "1; mode=block";
add_header                  X-Robots-Tag none;
