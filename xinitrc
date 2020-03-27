#!/bin/sh

# set wallpaper
feh --bg-scale ~/Pictures/wallpapers/ultra_instinct.png

dwm &
compton -b &
sxhkd &

# set status bar
while true ; do
    statusdwm.sh
    sleep 1m
done
