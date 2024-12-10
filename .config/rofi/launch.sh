#!/bin/bash
dir="$HOME/.config/rofi/launchers/type-2"
theme='style-1'

## Run
rofi \
	-show drun \
	-theme ${dir}/${theme}.rasi
