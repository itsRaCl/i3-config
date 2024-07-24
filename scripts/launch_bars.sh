#!/usr/bin/env bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar.log
if [[ $(optimus-manager --print-mode | cut -d":" -f2) = ' nvidia' ]];
then 
    MONITOR='eDP-1-1' polybar --reload laptop | tee -a /tmp/polybar1.log & disown
    MONITOR='HDMI-1-1' polybar --reload display | tee -a /tmp/polybar1.log & disown
else
    MONITOR='eDP-1' polybar --reload laptop | tee -a /tmp/polybar1.log & disown
    MONITOR='HDMI-1' polybar --reload display | tee -a /tmp/polybar1.log & disown
fi 
echo "Bars launched"
