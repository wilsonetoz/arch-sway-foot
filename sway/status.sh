#! /bin/bash

get_volume() {
  amixer -M get Master | grep -oE "[0-9]+%" | head -n 1
}
volume_icon="🔉"

get_date() {
  date +'%a %b %d %H:%M'
}

get_wifi_ssid() {
  iwconfig | grep ESSID | sed -e 's/.*ESSID:"\(.*\)".*/\1/'
}
wifi_icon="📶"

get_brightness() {
  light | awk '{printf "%d%s", $1, "%" }'
}
brightness_icon="🔆"

while :
do
  volume=$(get_volume)
  date=$(get_date)
  wifi_ssid=$(get_wifi_ssid)
  brightness=$(get_brightness)
  echo "$wifi_icon $wifi_ssid $volume_icon $volume $brightness_icon $brightness | $date "
  sleep 1
done
