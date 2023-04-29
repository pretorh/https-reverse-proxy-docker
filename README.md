# HTTPS Reverse Proxy

`nginx` server with util script to isssue and renew (auto and manual) certificates from Lets Encrypt and
serve multiple hostnames (reverse proxy)

## Set up / first run

To install a new domain, start the docker container with the mount point (at least into `/opt/rproxy/private`)
and http port (`-p 80:80). Use the `domain-setup.sh` script to issue certificates and install them:

```bash
docker run --rm -ti \
    -p 80:80 \
    -v $(pwd)/.private:/opt/rproxy/private \
    pretorh/https-reverse-proxy:latest ./domain-setup.sh domain1.tld domain2.tld ...
```

## Hosting

See `docker-compose.yml` for an example. Then either sset the root path, or `proxy_pass` to another service

See `./examples/`
