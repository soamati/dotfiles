#!/bin/sh

if [ $(pulseaudio-ctl | grep "Is source muted" | wc -c) -eq 47 ]; then
  echo "OFF" # Muted Icon (Install Some icon pack like feather, nerd-fonts)
else
  echo "ON" # Unmuted Icon (Install Some icon pack like feather, nerd-fonts)
fi
