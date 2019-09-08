#!/bin/bash

INTERFACE="${BLOCK_INSTANCE:-wlp4s0}"

export theme_blue="#DBFFFA"
export theme_green="#70FFBC"
export theme_yellow="#FFE471"
export theme_red="#FF7070"
export theme_black="#443850"
export theme_white="#f3f4f5"

# (1 = Left, 2 = Middle, 3 = Right, 4 = Scroll Up, 5 = Scroll Down, 6 = Custom, 7 = Custom, 8 = Upper Thumb, 9 = Lower Thumb, 10+ = Custom)
# Right Click toggles WIFI power
case $BLOCK_BUTTON in
    3) 
    if [ $(nmcli radio wifi) == "enabled" ];then
        echo "turn OFF"
        nmcli radio wifi off
        pkill -RTMIN+4 i3blocks
    else
        echo "turn ON"
        nmcli radio wifi on
        pkill -RTMIN+4 i3blocks
    fi;;
esac

[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] ||
    [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]] && echo "OFF" && echo "OFF" && echo $theme_red && exit

#------------------------------------------------------------------------

QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

#------------------------------------------------------------------------

echo $QUALITY% # full text
echo $QUALITY% # short text

# color
if [[ $QUALITY -ge 80 ]]; then
    echo $theme_white
elif [[ $QUALITY -lt 80 ]]; then
    echo $theme_green
elif [[ $QUALITY -lt 60 ]]; then
    echo $theme_yellow
elif [[ $QUALITY -lt 40 ]]; then
    echo $theme_red
fi
