#!/bin/sh

# android studio requires this to display properly with dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# qtile &
picom &
sxhkd &
dunst &
dwm &
# nm-applet &

# set wallpaper
nitrogen --restore &

# set status bar
while true ; do
    statusdwm.sh
    sleep 500ms
done
