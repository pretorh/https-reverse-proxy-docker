FROM nginx:alpine

RUN apk update --no-cache && \
    apk add openssl acme.sh

WORKDIR /opt/rproxy/
VOLUME /opt/rproxy/private
RUN rm -rfv /etc/ssl/acme/ && \
    ln -sfv /opt/rproxy/private/acme /etc/ssl/acme

RUN rm -rfv /root/.acme.sh && \
    ln -sfv /opt/rproxy/private/acme.sh /root/.acme.sh

COPY etc/ /etc/nginx/
COPY bin/ ./

CMD sh ./run.sh
