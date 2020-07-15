#!/usr/bin/sh
brightnessctl s +5%
light_level=$((100*$(brightnessctl g)/$(brightnessctl m)))
notification="$light_level% "
i=0
while [ "$i" -lt "$light_level" ]
do
    notification=$notification"▇"
    i=$(($i+5))
done
$HOME/.local/bin/unique_notification.py -s "Brightness" -m "$notification" -t 750

