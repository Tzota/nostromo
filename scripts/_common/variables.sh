#!/usr/bin/env bash
set -euo pipefail

# machine type
ARCH=$(uname -m)

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
