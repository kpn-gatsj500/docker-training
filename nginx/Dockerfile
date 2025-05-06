FROM nginx:alpine

# Install envsubst
RUN apk add --no-cache gettext

# Copy your config as a template (not directly to the default.conf)
COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template

# Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/custom-entrypoint.sh

# Make it executable
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

# Set it as the entrypoint
ENTRYPOINT ["/usr/local/bin/custom-entrypoint.sh"]

# Keep the default CMD
CMD ["nginx", "-g", "daemon off;"]
