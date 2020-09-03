#!/bin/sh
xrandr --output HDMI1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL1 --off --output eDP1 --off

# switch sound to hdmi
pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo
