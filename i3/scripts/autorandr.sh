#!/bin/bash
# INTERNAL = eDP1
# EXTERNAL = HDMI2
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ $output =~ ^HDMI.*$ ]]; then
            hdmi=$output
    fi
done
echo DISPLAY : $output
if echo $output | grep -iqF 'HDMI2' ; then
    echo Extending to HDMI output
    # xrandr  --output VIRTUAL1 --off --output eDP1 --mode 1366x768 --pos 1920x136 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output DP2 --off
else
    echo Using internal display only
    # xrandr  --output VIRTUAL1 --off --output eDP1 --mode 1366x768 --pos 0x0 --primary --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
fi
