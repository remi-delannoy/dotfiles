#!/usr/bin/bash
# bash because arrays are neat

bat_info=$(acpi battery)
battery_count=$(echo $bat_info | wc -l )
percentages=$(echo "$bat_info" | grep -o -m1 '[0-9]\{1,3\}%' | tr -d '%')
statuses=$(echo "$bat_info" | egrep -o -m1 'Discharging|Charging|AC|Not charging|Unknown')
remaining=$(echo "$bat_info" | egrep -o -m1 '[0-9][0-9]:[0-5][0-9]')
if [[ -n $remaining ]]; then
    remainings+=("$remaining")
else 
    remainings+=("N/A")
fi

squares="■"

#There are 8 colors that reflect the current battery percentage when 
#discharging
dis_colors=("${C1:-#FF0027}" "${C2:-#FF3B05}" "${C3:-#FFB923}" 
            "${C4:-#FFD000}" "${C5:-#E4FF00}" "${C6:-#ADFF00}"
			"${C7:-#6DFF00}" "${C8:-#10BA00}") 
charging_color="${CHARGING_COLOR:-#00AFE3}"
full_color="${FULL_COLOR:-#FFFFFF}"
ac_color="${AC_COLOR:-#535353}"


while getopts 1:2:3:4:5:6:7:8:c:f:a:h opt; do
    case "$opt" in
        1) dis_colors[0]="$OPTARG";;
        2) dis_colors[1]="$OPTARG";;
        3) dis_colors[2]="$OPTARG";;
        4) dis_colors[3]="$OPTARG";;
        5) dis_colors[4]="$OPTARG";;
        6) dis_colors[5]="$OPTARG";;
        7) dis_colors[6]="$OPTARG";;
        8) dis_colors[7]="$OPTARG";;
        c) charging_color="$OPTARG";;
        f) full_color="$OPTARG";;
        a) ac_color="$OPTARG";;
        h) printf "Usage: batterybar [OPTION] color
        When discharging, there are 8 [1-8] levels colors.
        You can specify custom colors, for example:
        
        batterybar -1 red -2 \"#F6F6F6\" -8 green
        
        You can also specify the colors for the charging, AC and
        charged states:
        
        batterybar -c green -f white -a \"#EEEEEE\"\n";
        exit 0;
    esac
done
if (( percentages > 0 && percentages < 20  )); then
    squares="▬▭▭▭▭"
elif (( percentages >= 20 && percentages < 40 )); then
    squares="▬▬▭▭▭"
elif (( percentages >= 40 && percentages < 60 )); then
    squares="▬▬▬▭▭"
elif (( percentages >= 60 && percentages < 80 )); then
    squares="▬▬▬▬▭"
else
    squares="▬▬▬▬▬"
fi

if [[ "$statuses" = "Unknown" ]]; then
    squares="<sup>?</sup>$squares"
fi

case "$statuses" in
"Charging")
    color="$charging_color"
;;
"Not charging")
    [ -f /tmp/battery_full ] || (touch /tmp/battery_full && notify-send 'Battery' 'Battery fully charged')
    color="$full_color"
;;
"AC")
    color="$ac_color"
;;
"Discharging"|"Unknown")
    rm -f /tmp/battery_full
    if (( percentages >= 0 && percentages < 10 )); then
        color="${dis_colors[0]}"
    elif (( percentages >= 10 && percentages < 20 )); then
        color="${dis_colors[1]}"
    elif (( percentages >= 20 && percentages < 30 )); then
        color="${dis_colors[2]}"
    elif (( percentages >= 30 && percentages < 40 )); then
        color="${dis_colors[3]}"
    elif (( percentages >= 40 && percentages < 60 )); then
        color="${dis_colors[4]}"
    elif (( percentages >= 60 && percentages < 70 )); then
        color="${dis_colors[5]}"
    elif (( percentages >= 70 && percentages < 80 )); then
        color="${dis_colors[6]}"
    else
        color="${dis_colors[7]}"
    fi
;;
esac
message="$message<span foreground=\"$color\">$squares $percentages% ($remainings)</span>" 

echo "$message"

