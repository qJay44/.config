#!/bin/zsh

wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $1

output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(echo $output | awk '{print $2}')
isMuted=$(echo $output | grep -q "MUTED" && echo true || echo false)
volumeInt=$(($volume * 100))

if $isMuted; then
  icon="<span color='#94e2d5' size='x-large'>󰝟</span>"
elif [[ $volume -lt 0.34 ]]; then
  icon=""
elif [[ $volume -lt 0.67 ]]; then
  icon=""
else
  icon=""
fi

dunstify -a "Volume" -r 5556 -h int:value:"$volumeInt" "" "<span color='#94e2d5'>$icon</span>"

