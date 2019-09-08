#!/bin/bash
icon="$HOME/.config/i3/lock.png"
img="/tmp/screenshotblur.png"
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
convert $img $icon -gravity center -composite $img
i3lock -i /tmp/screenshotblur.png --ignore-empty-password
rm /tmp/screenshot.png
rm /tmp/screenshotblur.png
