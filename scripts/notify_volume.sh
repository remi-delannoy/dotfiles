#!/usr/bin/sh
audio_level=$(pacmd list-sinks | awk '/*/ {getline;getline;getline;getline;getline;getline;getline;print}' | sed -r 's/.* ([0-9]{1,3})%.*/\1/')

if [ $audio_level -gt 100 ]
then\
    color='#BC5653'
else
    color='#D9D9D9'
fi
notification="<span foreground=\"$color\">$audio_level% "
i=0
while [ "$i" -lt "$audio_level" ]
do
    notification=$notification"▇"
    i=$((i+5))
done
notification="$notification</span>"
"$HOME/.local/bin/unique_notification.py" -s "Volume" -m $notification -t 750
