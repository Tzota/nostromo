#!/usr/bin/env bash

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh"

docker stop $MUTHUR_CONTAINER_NAME
