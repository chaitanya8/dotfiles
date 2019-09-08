#!/bin/bash
export theme_blue="#DBFFFA"
export theme_green="#70FFBC"
export theme_yellow="#FFE471"
export theme_red="#FF7070"
export theme_black="#443850"
export theme_white="#f3f4f5"
DEFAULT_SINK=$(/home/chaitanya/.config/i3/scripts/./audio_set_sink.sh)
CURVOL=`pactl list sinks | grep -A 10 "Sink #$DEFAULT_SINK" | grep Volume: | awk '{ print $5 }' | sed 's/%//'`
IS_MUTE=`pactl list sinks | grep -A 10 "Sink #$DEFAULT_SINK" | grep Mute | awk '{ print $2 }'`
# echo $CURVOL
if [ $IS_MUTE = "yes" ]; then
    echo "MUTE"
    echo "MUTE"
    echo $theme_red
else
    echo $CURVOL
fi

# (1 = Left, 2 = Middle, 3 = Right, 4 = Scroll Up, 5 = Scroll Down, 6 = Custom, 7 = Custom, 8 = Upper Thumb, 9 = Lower Thumb, 10+ = Custom)
# Right Click toggles WIFI power
case $BLOCK_BUTTON in
    3) pactl set-sink-mute $DEFAULT_SINK 1 || pactl set-sink-mute $DEFAULT_SINK 0 
esac
