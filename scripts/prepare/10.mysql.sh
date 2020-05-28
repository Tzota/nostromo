#!/usr/bin/env bash
set -euo pipefail

docker create \
    -v nostromo-mysql-volume:/var/lib/mysql \
    --name nostromo-mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -p 3306:3306 \
    # maybe clover/mysqld and clover/mysql are good too
    hypriot/rpi-mysql
