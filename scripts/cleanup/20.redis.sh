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


docker container rm nostromo-redis

docker image rm $REDIS_IMAGE

rm -rf /opt/nostromo-redis/

# clean up vm.overcommit_memory = 1 from /etc/sysctl.conf
