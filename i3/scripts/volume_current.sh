#!/bin/sh
DEFAULT_SINK=$(/home/chaitanya/.config/i3/scripts/./audio_set_sink.sh)
CURVOL=`pactl list sinks | grep -A 10 "Sink #$DEFAULT_SINK" | grep Volume: | awk '{ print $5 }' | sed 's/%//'`
echo $CURVOL
