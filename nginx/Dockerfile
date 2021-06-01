FROM nginx:1.21.0-alpine

# setup for reload nginx from acme
RUN apk add --no-cache bash fcgi fcgiwrap spawn-fcgi

ENV PS1="\u@nginx:\w> "

# copy nginx configuration
COPY ./conf /etc/nginx
COPY ./docker-entrypoint.d /docker-entrypoint.d/
COPY ./bin /usr/bin

VOLUME ["/var/www", "/var/log/nginx"]