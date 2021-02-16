#!/usr/bin/env bash

_dirname="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pushd $1
ls | sort -n -r | xargs -n1 bash
popd
