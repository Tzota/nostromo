#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $MUTHUR_CONTAINER_NAME || exit 1
if [ $ARCH = "armv7l" ]
then
    docker exec $MUTHUR_CONTAINER_NAME date -d '+3 hour' '+%F %T'
fi
sleep 5s
docker logs -n 10 $MUTHUR_CONTAINER_NAME

set +e
