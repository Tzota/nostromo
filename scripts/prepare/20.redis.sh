#!/usr/bin/env bash
set -euo pipefail

if [ $UID -ne 0 ]
then
  echo "You are NOT root!"
  exit 1
fi

ARCH=$(uname -m)
if [ $ARCH = "armv7l" ]
then
    #maybe hypriot/redis is good too
    REDIS_IMAGE=arm32v7/redis
elif [ $ARCH = "x86_64" ]
then
    REDIS_IMAGE=redis
else
    echo  "UNKNOWN ARCHITECTURE"
    exit 1
fi

#######################

grep -qx 'vm.overcommit_memory = 1' /etc/sysctl.conf || printf "\n\n# tzota - prepare for redis\nvm.overcommit_memory = 1\n\n" >> /etc/sysctl.conf

docker create \
    --name nostromo-redis \
    -p 127.0.0.1:6379:6379 \
    --restart unless-stopped \
    $REDIS_IMAGE \
    --appendonly yes \
    --maxmemory 512mb \
    --tcp-backlog 128

mkdir -p /opt/nostromo-redis/{etc,data}
mkdir /opt/nostromo-redis/data/{bases,log}

REDIS_VERSION=$(docker image inspect $REDIS_IMAGE | grep -e REDIS_VERSION | head -1 | sed -E 's/\s*"REDIS_VERSION=([0-9\.]*)",/\1/')
echo $REDIS_VERSION
curl -s -o /opt/nostromo-redis/etc/redis.conf https://raw.githubusercontent.com/antirez/redis/$REDIS_VERSION/redis.conf
