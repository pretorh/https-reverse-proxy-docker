FROM nginx:alpine

RUN apk update --no-cache && apk add acme-client libressl

COPY etc/ /etc/nginx/

WORKDIR /opt/rproxy/
COPY ./bin/* ./

CMD sh ./run.sh
