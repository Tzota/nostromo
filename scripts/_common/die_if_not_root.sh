#!/usr/bin/env bash

if [ $UID -ne 0 ]
then
  echo "You are NOT root!"
  exit 1
fi
