#!/bin/sh

# /* xrb -merge .Xresources */

# set wallpaper
nitrogen --restore &

# set status bar
while true ; do
    statusdwm.sh
    sleep 500ms
done
