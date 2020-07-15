#!/usr/bin/sh
pactl set-sink-mute @DEFAULT_SINK@ off
pactl set-sink-volume @DEFAULT_SINK@ -5%
$HOME/.local/bin/notify_volume.sh

