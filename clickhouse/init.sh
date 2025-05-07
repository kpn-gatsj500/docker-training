#!/bin/bash

# Start ClickHouse server in the background
./clickhouse server --config-file=/etc/clickhouse-server/config.xml &

sleep 1

# Wait for the server to start
until ./clickhouse client --query "SELECT 1" &>/dev/null; do
    echo "Waiting for ClickHouse to start..."
    sleep 1
done

# Execute the initialization SQL file
if [ -f /docker-entrypoint-initdb.d/init.sql ]; then
    echo "Running initialization script..."
    ./clickhouse client --multiquery < /docker-entrypoint-initdb.d/init.sql
fi

# Create a marker file to indicate initialization is complete
touch /tmp/initialized

echo "All done, keeping server running in foreground..."

# Keep the server running in the foreground
wait