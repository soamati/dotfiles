#!/bin/bash
dir="$HOME/.config/rofi/launchers/type-2"
theme='style-7-emoji'

## Run
rofi \
	-modi emoji \
	-show emoji \
	-theme ${dir}/${theme}.rasi
