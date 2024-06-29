#!/bin/sh

# android studio requires this to display properly with dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# qtile &
picom &
# nm-applet &
exec dwm
