#!/usr/bin/sh

cd /home/remi/Workspace/binance-trade/src
#tail get rid of all the messages that can be due to exception catching
status=$(python get_wallet.py | tail -n 1)
echo "<span foreground=\"#FFD000\">$status</span>"
