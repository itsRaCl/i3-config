#!/bin/bash
if [[ $(playerctl -i spotify status) = 'Playing' ]];
then
    exit 0
else
    i3lock -k -B 9 -e -f --indicator --inside-color=f38ba8 --ring-color=f38ba8 --keyhl-color=a6e3a1 --insidever-color=89b4fa --ringver-color=89b4fa
    xset dpms force suspend
fi
