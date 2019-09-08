#!/bin/bash
source_image=$1
TARGET_WALLPAPER="$HOME/.config/i3/background.jpg"
TARGET_LOCKSCREEN="$HOME/.config/i3/lockscreen.png"
ICON="$HOME/.config/i3/lock.png"

blur_image() {
    convert $TARGET_WALLPAPER -blur 0x5 $TARGET_LOCKSCREEN
    convert $TARGET_LOCKSCREEN $ICON -gravity center -composite $TARGET_LOCKSCREEN
}

cleanup () {
    if [[ -L $TARGET_WALLPAPER ]]; then
        unlink $TARGET_WALLPAPER
    fi
    if [[ -f TARGET_LOCKSCREEN ]]; then
        rm $TARGET_LOCKSCREEN
    fi
}

set_wallpaper () {
    cd ~/.config/i3
    ln -s $1 background.jpg
}

cleanup
set_wallpaper $1
ls ~/.config/i3
blur_image 
