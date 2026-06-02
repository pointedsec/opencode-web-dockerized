#!/bin/sh
set -e

: "${BASIC_AUTH_USER:=admin}"
: "${BASIC_AUTH_PASSWORD:=changeme}"

# Generate htpasswd file from environment variables
htpasswd -bc /etc/nginx/.htpasswd "$BASIC_AUTH_USER" "$BASIC_AUTH_PASSWORD"

exec nginx -g "daemon off;"
