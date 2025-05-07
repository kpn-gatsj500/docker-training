FROM alpine:edge

RUN apk add curl bash
RUN curl https://clickhouse.com/ | sh

# Preload config (need this else server wont honor conf.d files)
RUN mkdir -p /etc/clickhouse-server
RUN curl https://raw.githubusercontent.com/ClickHouse/ClickHouse/refs/heads/master/programs/server/config.xml > /etc/clickhouse-server/config.xml
RUN curl https://raw.githubusercontent.com/ClickHouse/ClickHouse/refs/heads/master/programs/server/users.xml > /etc/clickhouse-server/users.xml

# Create the data directory and set permissions
RUN mkdir -p /var/lib/clickhouse && \
    chown -R root:root /var/lib/clickhouse

# Copy initialization SQL file
COPY init.sql /docker-entrypoint-initdb.d/
# Copy config
COPY config.xml /etc/clickhouse-server/conf.d/

# Add a custom script to initialize the database
COPY init.sh /init.sh
RUN chmod +x /init.sh

HEALTHCHECK --interval=60s --timeout=1s --retries=1 --start-period=30s CMD \
  curl --fail http://localhost:8123/?query=SELECT%201 && [ -f /tmp/initialized ] || exit 1

# Use the custom script as the entrypoint
ENTRYPOINT ["/init.sh"]

# ENTRYPOINT ["tail", "-F", "/dev/null"]
# ENTRYPOINT ["./clickhouse", "server", "--config-file=/etc/clickhouse-server/config.xml"]
# ./clickhouse server --config-file=/etc/clickhouse-server/config.xml
