#!/usr/bin/env bash
set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/die_if_not_root.sh"
source "${_dirname}/../_common/variables.sh"

#######################

docker container stop nostromo-redis

docker container rm nostromo-redis

docker image rm $REDIS_IMAGE

rm -rf $REDIS_ROOT/nostromo-redis/

# sed -i '/tzota - prepare for redis/d' /etc/sysctl.conf
# sed -i '/vm.overcommit_memory = 1/d' /etc/sysctl.conf
