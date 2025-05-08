FROM alpine:edge

RUN apk add --no-cache grafana bash

# Set environment variables for Grafana admin user and password
ENV GF_SECURITY_ADMIN_USER=root \
    GF_SECURITY_ADMIN_PASSWORD=root \
    GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=grafana-clickhouse-datasource

WORKDIR /usr/share/grafana

# Find the plugins directory path
RUN mkdir -p /var/lib/grafana/plugins

# Install the ClickHouse plugin
RUN grafana-cli --pluginsDir "/var/lib/grafana/plugins" plugins install grafana-clickhouse-datasource

# Create provisioning directories if they don't exist
RUN mkdir -p /etc/grafana/provisioning/datasources /etc/grafana/provisioning/dashboards

# Expose Grafana's default port
EXPOSE 3000

# ENTRYPOINT ["tail", "-F", "/dev/null"]
CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]
