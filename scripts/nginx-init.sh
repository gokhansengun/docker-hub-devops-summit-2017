#!/bin/bash -e

# Find the ip address of the container
export IP_ADDR=`ip addr show eth0 | grep 'inet ' | awk '{ print $2 }' | awk -F/ '{ print $1 }'`;

envsubst '${IP_ADDR}' < /usr/share/nginx/html/index.html > /tmp/index.html

mv /tmp/index.html /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
