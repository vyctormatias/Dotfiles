#!/bin/sh

#  ╻ ╻╻┏┓╻╻╺┳╸┏━┓┏━╸
#  ┏╋┛┃┃┗┫┃ ┃ ┣┳┛┃
#  ╹ ╹╹╹ ╹╹ ╹ ╹┗╸┗━╸
# by mhess

## Set cursor
xsetroot -cursor_name left_ptr

## Typematic delay/rate
xset r rate 300 35

## Load Xresources
xrdb -load ~/.Xresources

## Autostart
numlockx
redshift &
udiskie &
[ ! -s ~/.config/mpd/mpd.pid ] && mpd

#exec bspwm
exec bspwm
