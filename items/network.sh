#!/bin/bash

source "$CONFIG_DIR/icons.sh"

wifi=(
  padding_right=7
  label.width=0
  icon="󰈀"
  script="$PLUGIN_DIR/network.sh"
)

sketchybar --add item network  right \
           --set network  "${wifi[@]}" \
           --subscribe network  wifi_change mouse.clicked
