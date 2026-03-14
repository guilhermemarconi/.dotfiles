#!/bin/bash

AVAILABLE_BYTES=$(df / | awk 'NR==2 {print $4}')
AVAILABLE_GB=$(awk "BEGIN {printf \"%.1fGB\", $AVAILABLE_BYTES / 1048576}")

sketchybar --set "$NAME" label="$AVAILABLE_GB"
