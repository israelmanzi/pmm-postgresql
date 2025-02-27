#!/bin/sh

set -ex

pmm-agent --config-file=/usr/local/percona/pmm2/config/pmm-agent.yaml > /var/log/pmm-agent.log 2>&1 &

sleep 5

pmm-admin config --force --server-insecure-tls --server-url=https://admin:admin@pmm-server:443 pg-service generic pg-client

pmm-admin add postgresql --username=postgres --password=password --query-source=pgstatstatements postgres pg-service:5432

sleep 5

pmm-admin list

exec tail -f /var/log/pmm-agent.log