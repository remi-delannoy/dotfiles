#!/usr/bin/sh
bt_device=$(bluetoothctl -- info | awk -F ': ' '/Name/ {print $2}')
wifi_device=$(iwctl station wlan0 show | awk '/Connected network/ {print $3}')
if [ "$bt_device" = "" ];then
    bt_device="<span foreground=\"#FF0027\">∅</span>"
else
    bt_device="<span foreground=\"#6DFF00\">$bt_device</span>"
fi
if [ "$wifi_device" = "" ];then
    wifi_device="<span foreground=\"#FF0027\">∅</span>"
else
    wifi_device="<span foreground=\"#6DFF00\">$wifi_device</span>"
fi
echo "ᛒ: $bt_device  Wifi: $wifi_device"
