FROM nginx:alpine

RUN apk update --no-cache && apk add acme-client

COPY etc/ /etc/nginx/

WORKDIR /opt/rproxy/
COPY ./bin/* ./
