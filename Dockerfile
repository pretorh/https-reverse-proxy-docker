FROM nginx:1.25.3-alpine3.18-slim

RUN apk update --no-cache && \
    apk add openssl acme.sh && \
    # symlink acme.sh, ssl certs from volume
    rm -rfv /etc/ssl/acme/ /root/.acme.sh && \
    ln -sfv /opt/rproxy/private/certs /etc/ssl/acme && \
    ln -sfv /opt/rproxy/private/acme.sh /root/.acme.sh

WORKDIR /opt/rproxy/
VOLUME /opt/rproxy/private

COPY etc/ /etc/nginx/
COPY bin/ ./

CMD sh ./run.sh
