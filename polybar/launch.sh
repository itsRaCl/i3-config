#!/usr/bin/env bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar.log

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done
echo "Bars launched"
