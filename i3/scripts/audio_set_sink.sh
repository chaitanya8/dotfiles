#! /bin/bash

#sink_internal_name=.analog-stereo
#sink_hdmi_name=.hdmi-stereo-extra1
#sink_usb_name=.iec958-stereo

# export input_sink_list=`pactl list sinks short`
# input_hdmi_connections=`
# echo $input_sink_list

data=$(pactl list sinks short)
sink_id_internal=`echo "$data" | awk '/.analog-stereo/{ print $1 }'`
sink_id_hdmi=`echo "$data" | awk '/.hdmi-stereo-extra1/{ print $1 }'`
sink_id_usb=`echo "$data" | awk '/.iec958-stereo/{ print $1}'`
# display_count=$(xrandr --listactivemonitors | grep Monitors | awk '{ print $2 }')

# if [ display_count == 2 ];then
    # pactl set-default-sink $sink_id_hdmi
if [ -z $sink_id_usb ]; then
    pactl set-default-sink $sink_id_internal
else
    pactl set-default-sink $sink_id_usb
fi
# TODO : How to handle plugged in HDMI (TV)?

default_sink=$(pactl info | awk '/Default Sink/{ print $3}')
default_sink_id=$(echo "$data" | grep $default_sink | awk '{split($0,a," "); print a[1]}')

# This output goes into your script which has to handle your Volume Control.
echo $default_sink_id
