#!/bin/sh

primary=DisplayPort-1
secondary=DisplayPort-2

is_connected() {
  xrandr --query | grep -q "^$1 connected"
}

preferred_layout() {
  xrandr \
    --output "$primary" --primary --mode 2560x1440 --rate 120.00 \
    --output "$secondary" --mode 1920x1080 --rate 120.00 --rotate right --right-of "$primary" \
    --output HDMI-A-0 --off
}

fallback_layout() {
  xrandr \
    --output "$primary" --primary --auto \
    --output "$secondary" --auto --rotate right --right-of "$primary" \
    --output HDMI-A-0 --off
}

apply_layout() {
  if ! is_connected "$primary"; then
    return 1
  fi

  if is_connected "$secondary"; then
    preferred_layout || fallback_layout
  else
    xrandr \
      --output "$primary" --primary --mode 2560x1440 --rate 120.00 \
      --output "$secondary" --off \
      --output HDMI-A-0 --off || \
    xrandr \
      --output "$primary" --primary --auto \
      --output "$secondary" --off \
      --output HDMI-A-0 --off
  fi
}

layout_ready() {
  xrandr --query | grep -q "^$primary connected primary"
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

if bspc query -M --names | grep -qx "$primary"; then
  bspc monitor "$primary" -d 1 2 3 4 5
fi

if bspc query -M --names | grep -qx "$secondary"; then
  bspc monitor "$secondary" -d 0
fi

if bspc query -D --names | grep -qx Desktop; then
  bspc desktop Desktop -r
fi
