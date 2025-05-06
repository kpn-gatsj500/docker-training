FROM nginx:alpine

# Install envsubst
RUN apk add --no-cache gettext

# Copy the nginx.conf file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the entrypoint script
CMD ["/entrypoint.sh"]
