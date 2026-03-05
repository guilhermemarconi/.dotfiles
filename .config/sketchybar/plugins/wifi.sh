#!/bin/bash

source "$CONFIG_DIR/colors.sh"

NETWORK_STATUS="$(ifconfig en0 | awk '/status:/{print $2}')"

if [ "$NETWORK_STATUS" = "active" ]; then
  sketchybar --set "$NAME" \
    icon= \
    icon.padding_right=10 \
    label.drawing=off
else
  sketchybar --set "$NAME" drawing=off
fi

