#!/bin/bash
if [ -n $XDG_CONFIG_HOME ]; then
    echo "XDG_CONFIG_HOME no configured, exiting..."
else
    cd $XDG_CONFIG_HOME/alacritty
    git clone --depth 1 https://github.com/alacritty/alacritty-theme 
fi