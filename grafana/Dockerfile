FROM alpine:edge

# Install Grafana and bash for troubleshooting
RUN apk add --no-cache grafana bash

# Set environment variables for Grafana admin user and password
ENV GF_SECURITY_ADMIN_USER=root \
    GF_SECURITY_ADMIN_PASSWORD=root \
    GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=grafana-clickhouse-datasource

# Create required directories with correct ownership
RUN mkdir -p /var/lib/grafana/plugins /etc/grafana/provisioning/datasources /etc/grafana/provisioning/dashboards

# Run in here
WORKDIR /usr/share/grafana

# Install clickhouse
RUN grafana-cli plugins install grafana-clickhouse-datasource

# Set configuration for plugin paths
RUN echo "[paths]" > /etc/grafana/grafana.ini \
    && echo "plugins = /var/lib/grafana/plugins;/usr/share/grafana/plugins" >> /etc/grafana/grafana.ini

# Copy datasource provisioning file
COPY clickhouse-datasource.yaml /etc/grafana/provisioning/datasources/


# Expose Grafana's default port
EXPOSE 3000

# Start Grafana with explicit config file
CMD ["/usr/sbin/grafana-server", "--config=/etc/grafana/grafana.ini"]
