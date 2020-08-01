#!/usr/bin/sh
powered=$(bluetoothctl -- show | awk -F ': ' 'NR==5 {print $2}')
if [ "$powered" = "no" ];then
  bluetoothctl -- power on || (notify-send 'Bluetooth' "Can't turn the bluetooth on" ; exit 1)
fi
device_name=$(bluetoothctl -- devices | awk '{for (i=3;i<=NF-1;i++) printf $i" ";print $NF}' | dmenu -i)
[ ! -z "$device_name" ] || exit 1
mac=$(bluetoothctl -- devices | awk "/$device_name/ {print \$2}")
paired=$(bluetoothctl -- info "$mac" | awk -F ': ' '/Paired/ {print $2}') 
if [ "$paired" = "no" ];then
    bluetoothctl -- pair "$mac" || (notify-send "Bluetooth" "Can't pair with  $device_name" ; exit 1)
fi
trusted=$(bluetoothctl -- info "$mac" | awk -F ': ' '/Trusted/ {print $2}') 
if [ "$trusted" = "no" ];then
    bluetoothctl -- trust "$mac" || (notify-send "Bluetooth" "Can't trust $device_name" ; exit 1)
fi
connected=$(bluetoothctl -- info "$mac" | awk -F ': ' '/Connected/ {print $2}') 
bluetoothctl -- connect "$mac"
if [ $? -ne 0 ];then
    pulseaudio --kill 
    pulseaudio --start
    bluetoothctl -- connect "$mac" || (notify-send "Bluetooth" "Can't connect to $device_name" ; exit 1)
fi
notify-send "Bluetooth" "Connected to $device_name"

