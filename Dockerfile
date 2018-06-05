FROM nginx:alpine

RUN apk update --no-cache && \
    apk add acme-client libressl

WORKDIR /opt/rproxy/
VOLUME /opt/rproxy/private
RUN rm -rv /etc/ssl/acme/ && \
    ln -sfv /opt/rproxy/private/acme /etc/ssl/acme

COPY etc/ /etc/nginx/
COPY bin/ ./

CMD sh ./run.sh
