line=$(hyprctl getoption decoration:screen_shader | head -n 1)
file="${line##*/}"

if [[ ${file%.frag} == 'hdmi' ]]; then
  shader='shaders/default.frag'
else
  shader='shaders/hdmi.frag'
fi

hyprctl keyword decoration:screen_shader $shader

