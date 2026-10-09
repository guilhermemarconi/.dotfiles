#!/bin/bash
# C C N     C = claude (hwc)     N = nvim (50%)
# D T N     D = pnpm run dev     T = janela que rodou o comando
#
# espera: DIR (cwd), WS_DRY (opcional, sem comandos)

run() { [ -n "$WS_DRY" ] && echo "" || echo "$1"; }

T=$($AERO list-windows --focused --format '%{window-id}')

# foca T antes de cada criação: janela nova entra ao lado de T, poucos moves depois
ws_focus "$T"; N=$(ws_win "$DIR" "$(run nvim)")
ws_focus "$T"; D=$(ws_win "$DIR" "$(run 'pnpm run dev')")
ws_focus "$T"; C=$(ws_win "$DIR" "$(run hwc)")

$AERO flatten-workspace-tree
$AERO layout --window-id "$T" tiles horizontal
ws_order "$C" "$D" "$T" "$N"

ws_focus "$D" && $AERO join-with right
ws_focus "$C" && $AERO join-with right
$AERO layout --window-id "$D" accordion horizontal
ws_focus "$T"
