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
    # [ -z "$(amixer get Master | grep -o "\[off\]")" ] && echo -n "VOL $(amixer get Master | grep "Front Left" | grep -o "[0-9]*%")" || echo -n "MUTE"
    echo "todo vol"
}

getbattery()
{
    charging="$(cat /sys/class/power_supply/BAT1/status)"
    capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
    if [ $charging = "Charging" ]; then
        echo -n "BAT $capacity % (CHR)"
    else
        echo -n "BAT $capacity %"
    fi
    
    # if [ $capacity = "20" ]; then
    #     notify-send "Battery running low: $capacity %"
    # elif [ $capacity = "10" ]; then
    #     notify-send "Battery running low: $capacity %"
    # fi
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
