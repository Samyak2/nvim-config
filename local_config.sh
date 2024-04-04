#!/usr/bin/env bash

current_dir=$(basename "$PWD")

if [[ $current_dir != "nvim" ]]; then
  echo "Current directory needs to be called 'nvim'. Exiting..."
  exit 1
fi

XDG_CONFIG_HOME=$PWD/.. nvim
