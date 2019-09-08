#!/bin/bash

# Simple script to handle a DIY display layout handling
# Requirements:
# - rofi
# - autorandr (with configs saved)

chosen=$(echo -e "[Cancel]\nInternal\nExternal\nTop\nLeft\nMirror" | rofi -dmenu -i -lines 6 -width 20)

if [[ $chosen = "Internal" ]]; then
    autorandr --change mobile
elif [[ $chosen = "External" ]]; then
    autorandr --change externalonly
elif [[ $chosen = "Top" ]]; then
    autorandr --change top
elif [[ $chosen = "Left" ]]; then
    autorandr --change docked
elif [[ $chosen = "Mirror" ]]; then
    autorandr --change mirror
fi
