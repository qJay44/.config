brightnessctl -e4 -n2 set $1
val=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

if   (( val < 33 )); then
  body="<span fgcolor='#f5e0dc'>󰃞</span>"
elif (( val < 66 )); then
  body="<span fgcolor='#f5c2e7'>󰃟</span>"
else
  body="<span fgcolor='#cba6f7'>󰃠</span>"
fi

dunstify -a "Brightness" -r 5555 -h int:value:"$val" "" "$body"
