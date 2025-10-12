#!/usr/bin/bash

desc=""
mute=""

output=$(pactl list sources | awk -v source="$(pactl get-default-source)" '
$0 ~ "Name: "source {found=1}
found && /Description:/ {sub(/.*Description: /, "");desc=$0}
found && /Mute:/ {mute=$2}
END {
  printf "%s\n%s\n", desc, mute
}
')

desc=$(echo "$output" | sed -n '1p')
mute=$(echo "$output" | sed -n '2p')

printf '{"alt": "%s", "tooltip": "%s"}\n' "$mute" "$desc"
