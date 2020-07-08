#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar bottom >>/tmp/polybar.log 2>&1 &
#polybar example >>/tmp/polybar.log 2>&1 &

echo "Bars launched..."
