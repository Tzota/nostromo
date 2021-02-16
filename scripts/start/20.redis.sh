#!/usr/bin/env bash
# set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $REDIS_IMAGE || exit 1
docker logs $REDIS_IMAGE
# docker exec -it nostromo-brett redis-cli
