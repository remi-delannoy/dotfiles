#!/bin/sh

cat "$HOME/Documents/emoji_list.txt" | wofi --show dmenu -i -p Emoji: > /tmp/emoji.txt
if [ $? -eq 0 ]; then
    awk '{ORS="" ; print $1}' /tmp/emoji.txt | wl-copy
fi
rm -f /tmp/emoji.txt
