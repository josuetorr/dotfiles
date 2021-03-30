#!/bin/sh

# set wallpaper
feh --bg-scale ~/Pictures/wallpapers/ultra_instinct.png

# qtile &
dwm &
compton -b &
dunst &
sxhkd &
nm-applet &

# set status bar
while true ; do
    statusdwm.sh
    sleep 500ms
done
