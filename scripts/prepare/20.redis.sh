#!/usr/bin/env bash

set -e

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/die_if_not_root.sh"
source "${_dirname}/../_common/variables.sh"

#######################

# https://redis.io/topics/admin
# это надо делать внутри контейнера :(
# grep -qx 'vm.overcommit_memory = 1' /etc/sysctl.conf || printf "\n\n# tzota - prepare for redis\nvm.overcommit_memory = 1\n\n" >> /etc/sysctl.conf

docker pull $REDIS_IMAGE

mkdir -p $REDIS_ROOT/nostromo-brett/{etc,data}
mkdir -p $REDIS_ROOT/nostromo-brett/data/{bases,log}

REDIS_VERSION=$(docker image inspect $REDIS_IMAGE | grep -e REDIS_VERSION | head -1 | sed -E 's/\s*"REDIS_VERSION=([0-9\.]*)",/\1/')
# echo $REDIS_VERSION
curl -s -o $REDIS_ROOT/nostromo-brett/etc/redis.conf https://raw.githubusercontent.com/antirez/redis/$REDIS_VERSION/redis.conf
sed -i -E 's/^dir .\/$/dir \/data\/bases/' $REDIS_ROOT/nostromo-brett/etc/redis.conf
sed -i -E 's/^bind 127.0.0.1$/# bind 127.0.0.1/' $REDIS_ROOT/nostromo-brett/etc/redis.conf
sed -i -E 's/^protected-mode yes$/# protected-mode no/' $REDIS_ROOT/nostromo-brett/etc/redis.conf

docker create \
    --name nostromo-brett \
    -p 127.0.0.1:6379:6379 \
    -v $REDIS_ROOT/nostromo-brett/etc/redis.conf:/usr/local/etc/redis/redis.conf \
    -v $REDIS_ROOT/nostromo-brett/data:/data \
    --restart unless-stopped \
    $REDIS_IMAGE \
    redis-server /usr/local/etc/redis/redis.conf \
    --appendonly yes \
    --maxmemory 512mb \
    --tcp-backlog 128 \

set +e
