#!/usr/bin/env bash
set -euo pipefail

grep -qx 'vm.overcommit_memory = 1' /etc/sysctl.conf || printf "\n\n# tzota - prepare for redis\nvm.overcommit_memory = 1\n\n" >> /etc/sysctl.conf

#maybe hypriot/redis is good too
docker create \
    --name nostromo-redis \
    -p 127.0.0.1:6379:6379 \
    --restart unless-stopped \
    arm32v7/redis \
    --appendonly yes \
    --maxmemory 512mb \
    --tcp-backlog 128
