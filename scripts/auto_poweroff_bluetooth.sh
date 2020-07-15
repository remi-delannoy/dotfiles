#!/usr/bin/sh

bt_device=$(bluetoothctl -- info | awk -F ': ' '/Name/ {print $2}')
powered=$(bluetoothctl -- show | awk -F ': ' 'NR==5 {print $2}')
if [ "$bt_device" = "" ] && [ "$powered" = "yes" ];then
    bluetoothctl -- power off && notify-send "Bluetooth" "Bluetooth has been automatically turned off"
fi
