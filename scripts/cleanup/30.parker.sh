#!/usr/bin/env bash

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh" || exit 1

#######################
hard=0
 while :; do
    case "${1-}" in
    -h | --hard) hard=1 ;;
    -v | --verbose) set -x ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done
#######################

docker container stop $PARKER_CONTAINER_NAME

docker container rm $PARKER_CONTAINER_NAME

if [[ $hard -gt 0 ]]
then
    docker image rm $PARKER_IMAGE
fi
