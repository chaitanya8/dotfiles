#!/bin/bash

ALACRITTY_THEME_LIGHT="alabaster"
ALACRITTY_THEME_DARK="dracula"
ALACRITTY_CONF_FILE_PATH="${XDG_CONFIG_HOME}/alacritty/alacritty.toml"

# TODO : NVIM Theme Switch

tmp=$(expr $(date +%H))
hour=$(($tmp))

if [ "$hour" -gt 18 ]; then 
    theme="dark"
elif [ $hour -lt 6 ]; then
    theme="dark"
else
    theme="light"
fi

# pre-process alacritty config for future replacements
sed -i".bak" -e "s/$ALACRITTY_THEME_DARK/ALACRITTY_THEME_NAME/" -e "s/$ALACRITTY_THEME_LIGHT/ALACRITTY_THEME_NAME/" $ALACRITTY_CONF_FILE_PATH


if [ "$theme" = "light" ]; then
    echo "converting to light"
    sed -i".bak" -e "s/ALACRITTY_THEME_NAME/$ALACRITTY_THEME_LIGHT/" $ALACRITTY_CONF_FILE_PATH
else [ "$theme" = "dark" ]
    echo "converting to dark"
    sed -i".bak" -e "s/ALACRITTY_THEME_NAME/$ALACRITTY_THEME_DARK/" $ALACRITTY_CONF_FILE_PATH
fi
