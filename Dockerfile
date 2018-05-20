FROM nginx:alpine

RUN apk update --no-cache && apk add acme-client

COPY etc/ /etc/nginx/
