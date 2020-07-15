#!/usr/bin/sh
pid_lock=$( ps aux | awk '/swayidle.*CRITICAL/ {print $2}' | head -n1 )
pid_screen=$( ps aux | awk '/swayidle.*dpms/ {print $2}' | head -n1 )
kill -10 $pid_lock && sleep 0.15 && kill -10 $pid_screen
