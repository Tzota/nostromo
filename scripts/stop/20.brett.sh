#!/usr/bin/env bash

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker stop $BRETT_CONTAINER_NAME
