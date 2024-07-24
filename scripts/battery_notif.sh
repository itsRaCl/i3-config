#!/bin/bash

low=20
critical=10

unplug=90


notified=0

while true; do
	battery=$(cat /sys/class/power_supply/BAT0/capacity)
	status=$(cat /sys/class/power_supply/BAT0/status)
	
	if [ "$status" = "Charging" ] && [ $battery -ge $unplug ] ; then
		notify-send --urgency critical "Unplug Charger" "Save Battery Health" 
	elif [ "$status" = "Discharging" ] && [ $battery -le $low ] && [ $battery -ge $critical ] ; then
		notify-send "Plug in charger!" "Battery at 20%" --urgency normal
	elif [ "$status" = "Discharging" ] && [ $battery -le $critical ] ; then
		notify-send "Plug in charger!" "Battery at 10%" --urgency critical 
	fi

	sleep 60;
done
