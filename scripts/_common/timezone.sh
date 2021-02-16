#!/usr/bin/env bash

if [ -z "$1" ]
then
echo "missing container name"
exit 1
fi

docker exec $1 mv /etc/localtime /etc/localtime.backup
docker exec $1 ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
