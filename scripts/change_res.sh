#!/usr/bin/sh
output=$(swaymsg -t get_outputs | jq '.[] | .name')
nb_output=$(echo "$output" | wc -l)
if [ $nb_output -gt 1 ];then
  output=$(echo "$output"| wofi --show dmenu -i -p "monitor:")
fi
[ -z $output ] && exit 1
mode=$(swaymsg -t get_outputs | jq ".[] | select(.name == $output)| .modes")
mode=$(echo $mode | jq '.[] | (.width | tostring)+"x"+(.height | tostring)+"@"+(.refresh/1000 | tostring)+"Hz"' | wofi --show dmenu -i -p "mode:")
[ -z $mode ] && exit 1
swaymsg output $output res $mode
