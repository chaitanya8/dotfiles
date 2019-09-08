#!/bin/bash

# theme
export theme_blue="#DBFFFA"
export theme_green="#70FFBC"
export theme_yellow="#FFE471"
export theme_red="#FF7070"
export theme_black="#443850"
export theme_white="#f3f4f5"

data=$(acpi -b | grep 'Battery ' | sed "s/,//g")
is_charging=$(echo $data | awk '{ print $4 }')
battery_percent=$(echo $data | awk '{ print $4 }' | sed "s/%//g") 
battery_time=$(echo $data | awk '{ print $5 }')
echo $is_charging
# battery_percent=$1
echo "$battery_percent"%
# echo $battery_time
if [ $is_charging="Discharging" ]; then
	if [ $battery_percent -le 25 ]; then
		echo $theme_red
	elif [ \( $battery_percent -le 50 \) -a \( $battery_percent -gt 25 \) ]; then
		echo $theme_yellow
	elif [ \( $battery_percent -le 75 \) -a \( $battery_percent -gt 50 \) ]; then
		echo $theme_green
	elif [ $battery_percent -gt 75 ]; then
		echo $theme_white
	fi
else
	echo $theme_white
fi

