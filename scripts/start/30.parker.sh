#!/usr/bin/env bash
# set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $PARKER_CONTAINER_NAME || exit 1
sleep 5s
docker logs $PARKER_CONTAINER_NAME
