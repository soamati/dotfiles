#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch main bar
echo "---" | tee -a /tmp/polybar1.log
polybar primary 2>&1 | tee -a /tmp/polybar1.log &
disown

sec=$(xrandr -q | grep 'HDMI-A-0')
# Do not launch secondary bar (1 desktop)
# sec="nope"
if [[ $sec = *connected* ]]; then
  # Launch foo bar
  echo "---" | tee -a /tmp/polybar1.log
  polybar secondary 2>&1 | tee -a /tmp/polybar1.log &
  disown
fi

echo "Bars launched!"
