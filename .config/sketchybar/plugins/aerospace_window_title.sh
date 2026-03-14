#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused | tr -d '[:space:]')}"

if [ "$NAME" = "workspace.$FOCUSED" ]; then
  sketchybar --set "$NAME" \
    background.color="$ITEM_BG_COLOR" \
    background.border_color=0x00000000 \
    label.color=0xffffffff
else
  sketchybar --set "$NAME" \
    background.color=0x00000000 \
    background.border_color="$ITEM_BG_COLOR" \
    label.color="$ITEM_BG_COLOR"
fi
