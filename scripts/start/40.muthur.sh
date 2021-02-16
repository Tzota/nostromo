#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $MUTHUR_CONTAINER_NAME || exit 1
sleep 5s
docker logs $MUTHUR_CONTAINER_NAME

docker start $PARKER_CONTAINER_NAME
docker exec $PARKER_CONTAINER_NAME mv /etc/localtime /etc/localtime.backup
docker exec $PARKER_CONTAINER_NAME ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
docker stop $PARKER_CONTAINER_NAME

set +e
