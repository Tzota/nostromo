#!/usr/bin/env bash
# set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $BRETT_CONTAINER_NAME || exit 1
docker logs -n 20 $BRETT_CONTAINER_NAME
# docker exec -it nostromo-brett redis-cli
