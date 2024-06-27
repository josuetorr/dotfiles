#!/bin/sh

# /* xrb -merge .Xresources */

while true; do
    xsetroot -name "$( date + "%F %I:%M %p")"
    sleep 10
done &

exec dwm

feh --bg-scale ~/Pictures/wallpapers/ultra_instinct.png
