#!/bin/sh

x=$(echo "US\nCA" | dmenu -i -p "Select a keyboard layout")

case $x in
    US) setxkbmap -layout us;;
    CA) setxkbmap -layout ca;;
esac
