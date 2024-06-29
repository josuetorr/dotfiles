#!/bin/sh

# android studio requires this to display properly with dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# qtile &
picom &
sxhkd &
dunst &
# nm-applet &

# set status bar
# while true ; do
#     statusdwm.sh
#     sleep 500ms
# done
exec dwm
