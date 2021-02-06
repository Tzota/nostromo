#!/usr/bin/env bash
# set -euo pipefail

docker start nostromo-brett || exit 1
docker logs nostromo-brett
# docker exec -it nostromo-brett redis-cli
