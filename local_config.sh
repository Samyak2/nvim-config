#!/usr/bin/env bash

config_dir=$(dirname -- "$(realpath -- "$0")")

if [[ $(basename $config_dir) != "nvim" ]]; then
  echo "Current directory needs to be called 'nvim'. Got '$config_dir'. Exiting..."
  exit 1
fi

XDG_CONFIG_HOME="$config_dir/.." nvim "$@"
