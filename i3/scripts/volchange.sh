#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Need 1 argument (volup, voldown, volmute)"
    exit 1;
fi

DEFAULT_SINK=$(/home/chaitanya/.config/i3/scripts/./audio_set_sink.sh)
NOTIF_ID=99
# CMD_VOLUME_INTERNAL="pactl list sinks | grep "Volume:" | head -3 | tail -1 | awk '{print $5}' | sed -e 's/%//'"

getnewvol () {
    CURVOL=`pactl list sinks | grep -A 10 "Sink #$(/home/chaitanya/.config/i3/scripts/./audio_set_sink.sh)" | grep Volume: | awk '{ print $5 }' | sed 's/%//'`
    if [ `pactl list sinks  | grep Mute | awk '{print $2}'` = 'yes' ]; then
        echo "Muted"
        ICON=audio-volume-muted
        return
    fi
    echo "Current volume $CURVOL"
    if [ $CURVOL -gt 75 ]; then
        ICON=audio-volume-high-symbolic.symbolic
    elif [ $CURVOL -gt 35 ]; then
        ICON=audio-volume-medium-symbolic.symbolic
    elif [ $CURVOL -gt 0 ]; then
        ICON=audio-volume-low-symbolic.symbolic
    fi
}


if [ $1 = 'volup' ]; then
    echo "Up"
    pactl set-sink-volume $DEFAULT_SINK +5%
    MSG='Volume Up'
    PRIORITY='low'
    getnewvol
elif [ $1 = 'voldown' ]; then
    echo "Down"
    pactl set-sink-volume $DEFAULT_SINK -5%
    MSG='Volume Down'
    PRIORITY='low'
    getnewvol
elif [ $1 = 'volmute' ]; then
    echo "Mute" 
    pactl set-sink-mute $DEFAULT_SINK toggle
    if [ `pactl list sinks  | grep Mute | awk '{print $2}'` = 'yes' ]; then
        MSG='Mute'
        ICON='audio-volume-muted-symbolic.symbolic'
    else
        MSG='Unmute'
        ICON='audio-volume-muted-symbolic.symbolic'
    fi
    PRIORITY='normal'
    getnewvol
fi
echo "ICON: $ICON"
echo "MSG: $MSG"
echo "CURVOL: $CURVOL"
# notify-send "$MSG : $CURVOL%" -u $PRIORITY -i /usr/share/icons/Adwaita/32x32/devices/$ICON.png
# bar=$(seq -s "─" $(($CURVOL / 5)) | sed 's/[0-9]//g')
# dunstify -C 99
dunstify -u $PRIORITY -i /usr/share/icons/Adwaita/32x32/devices/$ICON.png -r $NOTIF_ID -t 1000 "$MSG : $CURVOL%"
# paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
