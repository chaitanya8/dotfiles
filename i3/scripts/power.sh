#!/bin/bash
# (1 = Left, 2 = Middle, 3 = Right, 4 = Scroll Up, 5 = Scroll Down, 6 = Custom, 7 = Custom, 8 = Upper Thumb, 9 = Lower Thumb, 10+ = Custom)
# Right Click puts system to sleep
echo ""
case $BLOCK_BUTTON in
    1) /home/chaitanya/.config/i3/scripts/./power_menu.sh
esac
