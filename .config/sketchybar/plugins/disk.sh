#!/bin/bash

LABEL="$(diskutil apfs list | awk -F '[()]' '/Container disk3/{f=1} f && /Capacity Not Allocated/{print $2; exit}')"

sketchybar --set "$NAME" label="$LABEL"
