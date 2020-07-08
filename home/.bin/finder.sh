#!/usr/bin/env bash

xdg-open "$(
	fd -i . /home /mnt --type f |
	sed 's/ /\\ /g;s/\\//g' |
	sort -f |
	rofi -threads 0 -width 60 -dmenu -i -p "find"
)"

