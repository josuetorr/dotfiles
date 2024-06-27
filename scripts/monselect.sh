#!/bin/sh

x=$(echo "Laptop\nHDMI\nHDMI-Single\nManual" | dmenu -i -p "Select a monitor layout: ")

case $x in
    Laptop) laptopmonlayout.sh;;
    HDMI) hdmimonlayout.sh;;
    HDMI-Single) hdmisinglelayout.sh;;
    Manual) arandr;;
esac


