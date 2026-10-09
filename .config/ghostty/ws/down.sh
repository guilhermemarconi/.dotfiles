#!/bin/bash
# fecha todas as janelas Ghostty exceto a focada

keep=$($AERO list-windows --focused --format '%{window-id}')
for id in $(ws_ghostty_ids); do
	[ "$id" != "$keep" ] && $AERO close --window-id "$id"
done
