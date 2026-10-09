#!/bin/bash
# helpers compartilhados pelos layouts. Uso: source lib.sh

GHOSTTY_ID="com.mitchellh.ghostty"
AERO="${AERO:-aerospace}"

ws_ghostty_ids() {
	$AERO list-windows --monitor all --app-bundle-id "$GHOSTTY_ID" --format '%{window-id}' | sort -n
}

# ws_win <cwd> [input]: abre janela Ghostty, imprime o window-id do Aerospace
ws_win() {
	local cwd="$1" input="$2" before after id i
	before=$(ws_ghostty_ids)

	osascript - "$cwd" "$input" <<'APPLESCRIPT' >/dev/null
on run argv
	set theDir to item 1 of argv
	set theInput to item 2 of argv
	tell application "Ghostty"
		if theInput is "" then
			new window with configuration {initial working directory:theDir}
		else
			new window with configuration {initial working directory:theDir, initial input:theInput & linefeed}
		end if
	end tell
end run
APPLESCRIPT

	for i in $(seq 1 150); do
		after=$(ws_ghostty_ids)
		id=$(comm -13 <(echo "$before") <(echo "$after") | head -n1)
		if [ -n "$id" ]; then
			echo "$id"
			return 0
		fi
		sleep 0.02
	done
	echo "ws: janela nova não apareceu no aerospace" >&2
	return 1
}

ws_focus() { $AERO focus --window-id "$1"; }

# ws_order <id...>: reordena janelas do workspace focado na ordem dada (dentro de root plano)
ws_order() {
	local want=("$@") i id pos
	for i in "${!want[@]}"; do
		id="${want[$i]}"
		while :; do
			pos=$($AERO list-windows --workspace focused --format '%{window-id}' | grep -n -x "$id" | cut -d: -f1)
			[ "$((pos - 1))" -le "$i" ] && break
			$AERO move --window-id "$id" left || break
		done
	done
}
