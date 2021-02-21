#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

ARM_PART=""
if [ $ARCH = "armv7l" ]
then
  ARM_PART="-v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket:ro"
fi

docker start $BRETT_CONTAINER_NAME

docker create \
    --name $MUTHUR_CONTAINER_NAME \
    --link $BRETT_CONTAINER_NAME:redis \
    --env REDIS_SERVER=redis \
    --env BOT_ID=$MUTHUR_BOT_ID \
    $ARM_PART \
    $MUTHUR_IMAGE:0.0.1

docker start $MUTHUR_CONTAINER_NAME

if [ $ARCH = "armv7l" ]
then
    docker exec $MUTHUR_CONTAINER_NAME apt-get -y update && apt-get -y install systemd
fi

"${_dirname}/../_common/timezone.sh" $MUTHUR_CONTAINER_NAME

docker stop $MUTHUR_CONTAINER_NAME
docker stop $BRETT_CONTAINER_NAME

set +e
