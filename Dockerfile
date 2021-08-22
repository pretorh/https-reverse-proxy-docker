FROM nginx:alpine

RUN apk update --no-cache && \
    apk add openssl acme.sh

WORKDIR /opt/rproxy/
VOLUME /opt/rproxy/private
RUN rm -rfv /etc/ssl/acme/ && \
    ln -sfv /opt/rproxy/private/acme /etc/ssl/acme

COPY etc/ /etc/nginx/
COPY bin/ ./

CMD sh ./run.sh
