#!/usr/bin/env bash

set -e

# machine type
ARCH=$(uname -m)
EXTERNAL_MEDIA=$(mount | grep -e 'on /media/' | sed -E 's/^[\/a-z0-9]* on (\/media\/[a-z\/0-9A-Z\-]*) .*$/\1/' || echo '')
PARKER_CONTAINER_NAME="nostromo-parker-redis-stream"

# redis docker image
if [ $ARCH = "armv7l" ]
then
    #maybe hypriot/redis is good too
    REDIS_IMAGE=arm32v7/redis
    PARKER_ARCH=arm
elif [ $ARCH = "x86_64" ]
then
    REDIS_IMAGE=redis
    PARKER_ARCH=amd64
else
    echo  "UNKNOWN ARCHITECTURE"
    exit 1
fi
PARKER_IMAGE=nostromo-parker-redis-stream-$PARKER_ARCH

echo "REDIS_IMAGE=${REDIS_IMAGE}"
echo "PARKER_IMAGE=${PARKER_IMAGE}"

# redis files
# if [ "$EXTERNAL_MEDIA" = "" ]
# then
REDIS_ROOT="/opt"
# else
# REDIS_ROOT="${EXTERNAL_MEDIA}"
# fi
echo "REDIS_ROOT=${REDIS_ROOT}"

set +e
