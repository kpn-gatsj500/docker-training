#!/bin/sh
set -e

# Replace environment variables in the config file
envsubst '${FRONTEND_NAME} ${FRONTEND_PORT} ${BACKEND_NAME} ${BACKEND_PORT}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf

# Execute the original entrypoint with the passed arguments
exec /docker-entrypoint.sh "$@"