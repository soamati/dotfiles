#!/bin/sh

primary=DisplayPort-1
secondary=DisplayPort-2

apply_layout() {
  xrandr \
    --output "$primary" --primary --mode 2560x1440 --rate 120.00 \
    --output "$secondary" --mode 1920x1080 --rate 120.00 --rotate right --right-of "$primary" \
    --output HDMI-A-0 --off
}

layout_ready() {
  xrandr --query | grep -q "^$primary connected primary 2560x1440+0+0 " && \
    xrandr --query | grep -q "^$secondary connected 1080x1920+2560+0 right "
}

attempt=0
while [ "$attempt" -lt 15 ]; do
  apply_layout

  if layout_ready; then
    break
  fi

  attempt=$((attempt + 1))
  sleep 1
done

if bspc query -M --names | grep -qx HDMI-A-0; then
  bspc monitor HDMI-A-0 -r
fi

bspc monitor "$primary" -d 1 2 3 4 5
bspc monitor "$secondary" -d 0

if bspc query -D --names | grep -qx Desktop; then
  bspc desktop Desktop -r
fi
