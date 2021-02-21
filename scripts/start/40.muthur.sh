#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $MUTHUR_CONTAINER_NAME || exit 1
sleep 5s
docker logs -n 10 $MUTHUR_CONTAINER_NAME

set +e
