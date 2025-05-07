CREATE DATABASE IF NOT EXISTS nginxdb;

CREATE TABLE IF NOT EXISTS  nginxdb.logs (
    message String
)
ENGINE = MergeTree()
ORDER BY tuple();