#!/bin/bash

/* xrb -merge .Xresources */

while true; do
    xsetroot -name "$( date + "%F %I:%M %p")"
    sleep 10
done &

exec dwm
