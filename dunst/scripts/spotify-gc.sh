#!/bin/zsh

TITLE="$DUNST_SUMMARY"
ARTIST=$(echo "$DUNST_BODY" | awk -v RS='\n\n' 'NR==2 {print $0}' | head -n 1)
LAST_LINE=$(echo "$DUNST_BODY" | tail -n 1)
SCROBBLES=$(echo "$LAST_LINE" | grep -o '[0-9]\+')

SUMMARY=" Spotify"
BODY="<big>$TITLE<span fgcolor='#FFE756'> ($SCROBBLES)</span></big>\n<span fgcolor='#c0c0c0'>$ARTIST</span>"

local -a icon_cmd
[[ -n "$DUNST_ICON_PATH" ]] && icon_cmd=(-I "$DUNST_ICON_PATH")

dunstify -t 10000 -r $DUNST_ID -a "chrome_spotify_after" "${icon_cmd[@]}" "$SUMMARY" "$BODY"

