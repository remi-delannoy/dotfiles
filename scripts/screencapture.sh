#!/bin/bash

if [[ -z $WAYLAND_DISPLAY ]]; then
	(>&2 echo Wayland is not running)
	exit 1
fi

if [[ -z $SWAYSHOT_SCREENSHOTS ]]; then
	SWAYSHOT_SCREENSHOTS="/home/remi/Images"
fi

SCREENSHOT_TIMESTAMP=$(date "+${SWAYSHOT_DATEFMT:-%F_%H-%M-%S_%N}")

SCREENSHOT_FULLNAME="$SWAYSHOT_SCREENSHOTS"/screenshot_${SCREENSHOT_TIMESTAMP}.png

declare -r filter='
# returns the focused node by recursively traversing the node tree
def find_focused_node:
    if .focused then . else (if .nodes then (.nodes | .[] | find_focused_node) else empty end) end;
# returns a string in the format that grim expects
def format_rect:
    "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)";
find_focused_node | format_rect
'

notif_clipboard="notify-send \"Screencapture\" \"Screenshot save to clipboard\""
notif_file="notify-send 'Screencapture' 'Screenshot save to ${SCREENSHOT_TIMESTAMP}'"

case "$1" in
	-h|--help)
		echo 'Usage: swayshot [display|window|region] [-c]'
		;;
	region)
        selection="$(slurp -b '#AFAFAFAF' -c '#FF3F3FAF' -s '#00000000' -w 3 -d)"
        [ $? -eq 0 ] || exit 1
        if [ "$2" == "-c" ]
        then
            grim -g "$selection" - | wl-copy && eval $notif_clipboard
        else
            grim -g "$selection" $SCREENSHOT_FULLNAME && eval $notif_file
        fi
		;;
	window)
        if [ "$2" == "-c" ]
        then
            grim -g "$(swaymsg --type get_tree --raw | jq --raw-output "${filter}")" - | wl-copy && eval $notif_clipboard
        else
            grim -g "$(swaymsg --type get_tree --raw | jq --raw-output "${filter}")" $SCREENSHOT_FULLNAME && eval $notif_file
        fi
		;;
	*)
        if [ "$2" == "-c" ] || [ "$1" == "-c" ]
        then
            grim -o "$(swaymsg --type get_outputs --raw | jq --raw-output '.[] | select(.focused) | .name')" - | wl-copy && eval $notif_clipboard
        else
            grim -o "$(swaymsg --type get_outputs --raw | jq --raw-output '.[] | select(.focused) | .name')" $SCREENSHOT_FULLNAME && eval $notif_file
        fi
		;;
esac

