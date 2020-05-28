#!/usr/bin/env bash
set -euo pipefail

docker create \
    -v nostromo-mysql-volume:/var/lib/mysql \
    --name nostromo-mysql \
    -e MYSQL_ROOT_PASSWORD=root mysql
