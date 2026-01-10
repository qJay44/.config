#!/bin/bash

# Define the config file path
CONFIG_FILE=$HOME/.config/hypr/hyprland.conf

firstLine=$(hyprctl getoption input:touchpad:disable_while_typing | head -n 1)
state=${firstLine: -1}

if [[ "$state" = "1" ]]; then
  newState="false"
  iconState="on"
else
  newState="true"
  iconState="off"
fi

dunstify "$newState" -i "/usr/share/icons/Papirus-Dark/24x24/panel/input-touchpad-${iconState}.svg"
hyprctl keyword input:touchpad:disable_while_typing "$newState"

