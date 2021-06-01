#!/bin/bash

# run reload nginx @ nginx container
SCRIPT_FILENAME="/usr/bin/nginx_reload.sh" \
/usr/bin/cgi-fcgi -bind -connect nginx:9000