#!/bin/sh

GPU_MODE=$(optimus-manager --print-mode | cut -d":" -f2)  

MONITOR_COUNT=$(xrandr --listactivemonitors | head -n 1 | cut -d " " -f 2)
 

if [ "$GPU_MODE" = " nvidia" ] && [ $MONITOR_COUNT = 2 ];
then 
	xrandr --output eDP-1-1 --auto
	xrandr --output HDMI-1-1 --auto
	xrandr --output HDMI-1-1 --left-of eDP-1-1
elif [ "$GPU_MODE" = " nvidia" ] && [ $MONITOR_COUNT = 1 ];
then 
	xrandr --output eDP-1-1 --auto
elif [  "$GPU_MODE" = " integrated" ] && [ $MONITOR_COUNT = 2 ];
then 
	xrandr --output eDP-1 --auto
	xrandr --output HDMI-1 --auto
	xrandr --output HDMI-1 --left-of eDP-1
elif [[  "$GPU_MODE" = " integrated" || "$GPU_MODE" = " hybrid" ]] && [ $MONITOR_COUNT = 1 ];
then 
	xrandr --output eDP-1 --auto
elif [  "$GPU_MODE" = " hybrid" ] && [ $MONITOR_COUNT = 2 ];
then 
	xrandr --output eDP-1 --auto
	xrandr --output HDMI-1 --auto
	xrandr --output HDMI-1 --left-of eDP-1
elif [ "$GPU_MODE" = " hybrid" ] && [ $MONITOR_COUNT = 1 ];
then 
	xrandr --output eDP-1 --auto
fi 
