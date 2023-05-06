# HTTPS Reverse Proxy

`nginx` server with util scripts to issue and renew (auto and manual) certificates from Lets Encrypt and
serve multiple hostnames (reverse proxy)

## Set up / first run

To install a new domain, start the docker container with the mount point (at least into `/opt/rproxy/private`)
and http port (`-p 80:80`). Use the `domain-setup.sh` script to issue certificates and install them. See 
`examples/issue-certificates.sh` for an example.

## Hosting

See `docker-compose.yml` and site configs in `./examples/`
