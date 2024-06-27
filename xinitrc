#!/bin/zsh

# android studio requires this to display properly with dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# set wallpaper
nitrogen --restore &
# feh --bg-scale ~/Pictures/wallpapers/ultra_instinct.png

# qtile &
dwm &
picom &
sxhkd &
# nm-applet &

# set status bar
while true ; do
    statusdwm.sh
    sleep 500ms
done
