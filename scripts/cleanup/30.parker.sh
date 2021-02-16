#!/usr/bin/env bash

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh" || exit 1

source "${_dirname}/../_common/cleanup.sh" || exit 1

docker container stop $PARKER_CONTAINER_NAME

docker container rm $PARKER_CONTAINER_NAME

if [[ $hard -gt 0 ]]
then
    docker image rm $PARKER_IMAGE
fi
