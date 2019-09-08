#!/bin/bash
i3-msg restart
echo "Display configuration changed to $AUTORANDR_CURRENT_PROFILE" >>/tmp/scripts.log
