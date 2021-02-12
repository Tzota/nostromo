#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker create \
    --name $PARKER_CONTAINER_NAME \
    --env REDIS_SERVER=127.0.0.1 \
    --network=host \
    $PARKER_IMAGE:0.0.1

set +e
