#!/usr/bin/env bash

# NOTE: suspended

IFACE="wlan0"
IFACE_WIRED="enp4s0"
THEME_DIR="$HOME/.config/rofi/wifi"
WIFI_THEME="$THEME_DIR/wifi.rasi"
PASS_THEME="$THEME_DIR/password.rasi"

# force a new scan
scan_networks() {
  iwctl station "$IFACE" scan
}

# grab just the SSID column
get_networks() {
  nets=$(iwctl station "$IFACE" get-networks)
  echo "$nets"
  echo "\nafter\n"

  out=$(echo "$nets" | tail -n +5 | sed -e 's/\x1b\[[0-9;]*m//g' | sed 's/>/ /' | awk '/****/{print $1}')

  echo "$out"
}

# show connectivity status NOTE: Wi-Fi only
get_status() {
  local info=$(iwctl station "$IFACE" show)
  local staus name

  # Use awk to extract both 'State' and 'Connected network' in one pass
  read -r status name < <(echo "$info" | awk '
    /State/ { stat=$2 }
    /Connected network/ { net=$3 }
    END { print stat, net }
  ')

  printf "Wi-Fi: %s (%s)\n" $status $name
}

# main loop: Show SSIDs + Scan + Settings
main_menu() {
  scan_networks
  get_networks
  exit;
  while true; do
    scan_networks
    local status_line
    status_line=$(get_status)
    items="$status_line\nScan\nSettings\n"
    items+="$(get_networks)"
    CHOICE=$(printf "%b" "$items" \
      | rofi -dmenu -theme "$WIFI_THEME" -p "Wi-Fi ")
    R=$?
    # break on Esc/Ctrl-C
    [ $R -ne 0 ] && return 1

    case "$CHOICE" in
      Scan)
        continue
        ;;
      Settings)
        settings_menu
        ;;
      *)
        password_menu "$CHOICE" && return 0
        ;;
    esac
  done
}

# ask for Wi-Fi password
password_menu() {
  local ssid="$1"
  PASS=$(echo -n \
    | rofi -dmenu -password \
        -theme "$PASS_THEME" \
        -p "Password:")
  R=$?
  [ $R -ne 0 ] && return 1

  echo -n "$PASS" \
    | iwctl station "$IFACE" connect "$ssid"
  return 0
}

# tiny Settings submenu
settings_menu() {
  while true; do
    S=$(printf "Disable adapter\nBack" \
        | rofi -dmenu -theme "$WIFI_THEME" -p "Settings")
    R=$?
    [ $R -ne 0 ] && return 0
    case "$S" in
      "Disable adapter")
        iwctl station "$IFACE" set-property Powered off
        return 0
        ;;
      Back)
        return 0
        ;;
    esac
  done
}

main_menu
exit 0

