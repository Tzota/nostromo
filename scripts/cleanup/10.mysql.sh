#!/usr/bin/env bash
# set -euo pipefail

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_dirname}/../_common/variables.sh" || exit 1

source "${_dirname}/../_common/cleanup.sh" || exit 1

# docker container rm nostromo-mysql
# cleanup nostromo-mysql-volume:/var/lib/mysql
