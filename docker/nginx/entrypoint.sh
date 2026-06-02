#!/bin/sh
set -e

: "${BASIC_AUTH_USER:=admin}"

if [ -z "${BASIC_AUTH_PASSWORD}" ]; then
    echo "ERROR: BASIC_AUTH_PASSWORD environment variable is not set." >&2
    echo "Set it via a .env file or the environment before starting this container." >&2
    exit 1
fi

# Generate htpasswd file from environment variables
htpasswd -bc /etc/nginx/.htpasswd "$BASIC_AUTH_USER" "$BASIC_AUTH_PASSWORD"

exec nginx -g "daemon off;"
