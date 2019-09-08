#!/bin/bash
micid=$(pactl list sources short | grep alsa_input.*.analog-stereo | awk '{print $1}')
pactl set-source-mute $micid toggle
