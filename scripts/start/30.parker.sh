#!/usr/bin/env bash
# set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker start $PARKER_CONTAINER_NAME || exit 1
sleep 10s
docker logs -n 30 $PARKER_CONTAINER_NAME

