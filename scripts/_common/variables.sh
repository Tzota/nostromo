#!/usr/bin/env bash

set -e

# machine type
ARCH=$(uname -m)
EXTERNAL_MEDIA=$(mount | grep -e 'on /media/' | sed -E 's/^[\/a-z0-9]* on (\/media\/[a-z\/0-9A-Z\-]*) .*$/\1/' || echo '')

# redis docker image
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
echo "REDIS_IMAGE=${REDIS_IMAGE}"

# redis files
# if [ "$EXTERNAL_MEDIA" = "" ]
# then
REDIS_ROOT="/opt"
# else
# REDIS_ROOT="${EXTERNAL_MEDIA}"
# fi
echo "REDIS_ROOT=${REDIS_ROOT}"

set +e
