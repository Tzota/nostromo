#!/usr/bin/env bash
# set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh" || exit 1

source "${_dirname}/../_common/cleanup.sh" || exit 1

docker container stop nostromo-brett

docker container rm nostromo-brett

if [[ $hard -gt 0 ]]
then
    docker image rm $REDIS_IMAGE
fi

rm -rf $REDIS_ROOT/nostromo-brett/

# sed -i '/tzota - prepare for redis/d' /etc/sysctl.conf
# sed -i '/vm.overcommit_memory = 1/d' /etc/sysctl.conf
