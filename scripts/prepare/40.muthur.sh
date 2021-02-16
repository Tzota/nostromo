#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $BRETT_CONTAINER_NAME

docker create \
    --name $MUTHUR_CONTAINER_NAME \
    --link $BRETT_CONTAINER_NAME:redis \
    --env REDIS_SERVER=redis \
    --env BOT_ID=$MUTHUR_BOT_ID \
    $MUTHUR_IMAGE:0.0.1

docker start $MUTHUR_CONTAINER_NAME

"${_dirname}/../_common/timezone.sh" $MUTHUR_CONTAINER_NAME

docker stop $MUTHUR_CONTAINER_NAME
docker stop $BRETT_CONTAINER_NAME

set +e
