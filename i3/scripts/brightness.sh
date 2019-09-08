#!/bin/bash
# Brightness levels for my machine picked from 
# /sys/class/backlight/intel_backlight/actual_brightness

# 0 - 0
# 1 - 93
# 2 - 186 
# 3 - 279
# 4 - 372
# 5 - 465
# 6 - 558
# 7 - 651
# 8 - 768
# 9 - 937

export theme_blue="#DBFFFA"
export theme_green="#70FFBC"
export theme_yellow="#FFE471"
export theme_red="#FF7070"
export theme_black="#443850"
export theme_white="#f3f4f5"

# To change brightness, use : echo $LEVEL | sudo tee /sys/class/backlight/intel_backlight/brightness
MULTIPLIER=93 
LVL_HIGH=558
LVL_LOW=372

# (1 = Left, 2 = Middle, 3 = Right, 4 = Scroll Up, 5 = Scroll Down, 6 = Custom, 7 = Custom, 8 = Upper Thumb, 9 = Lower Thumb, 10+ = Custom)
case $BLOCK_BUTTON in
    5) xbacklight -dec 10 ;;
    4) xbacklight -inc 10 ;;
esac

# echo $CURR_BRIGHTNESS
CURR_BRIGHTNESS=`cat /sys/class/backlight/intel_backlight/actual_brightness`
PERCENT_BRIGHTNESS=`echo "import math;print(\"%d\" % math.floor($CURR_BRIGHTNESS/$MULTIPLIER))" | python3`

if [ $CURR_BRIGHTNESS -gt $LVL_HIGH ];then
    COLOR=$theme_red
elif [ \( $CURR_BRIGHTNESS -lt $LVL_HIGH \) -a \( $CURR_BRIGHTNESS -gt $LVL_LOW \) ]; then
    COLOR=$theme_yellow
elif [ $CURR_BRIGHTNESS -lt $LVL_LOW ];then
    COLOR=$theme_white
fi

echo "$PERCENT_BRIGHTNESS/10"
echo "Brightness : $PERCENT_BRIGHTNESS/10"
echo "$COLOR"
