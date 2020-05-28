#!/usr/bin/env bash
set -euo pipefail

# docker volume create mysql-once-volume

docker run --rm -v mysql-once-volume:/var/lib/mysql --name mysql-once -e MYSQL_ROOT_PASSWORD=root mysql #-d

docker run --rm --name myadmin-once --link mysql-once:db -p 8080:80 phpmyadmin/phpmyadmin

# docker volume rm mysql-once-volume

