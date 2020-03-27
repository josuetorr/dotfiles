#!/bin/sh

# echo -n is not posix compliant
delim=" | "

rmnl()
{
    tr "\n" "\0"
}

getdate()
{
    echo -n "$(date  +"%a %b %d %I:%M %p")" 
}

getvolume()
{
    [ -z "$(amixer get Master | grep -o "\[off\]")" ] && echo -n "VOL $(amixer get Master | grep -o "[0-9]*%")" || echo -n "MUTE"
}

getbattery()
{
    echo -n "BAT $(cat /sys/class/power_supply/BAT0/capacity)%"
}

printstatus()
{
    echo -n " "
    getvolume
    echo -n "$delim"
    getbattery
    echo -n "$delim"
    getdate
    echo -n " "
}

# print padding
xsetroot -name "$(printstatus)"
