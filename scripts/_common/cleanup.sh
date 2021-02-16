#!/usr/bin/env bash

#######################
hard=0
 while :; do
    case "${1-}" in
    -h | --hard) hard=1 ;;
    -v | --verbose) set -x ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done
#######################
