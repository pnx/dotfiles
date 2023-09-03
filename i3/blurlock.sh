#!/bin/bash

IMG=/tmp/lockscreenbg.png

# take screenshot
import -window root $IMG

# blur it
convert $IMG -blur 0x10 $IMG
#convert $IMG -scale 10% -scale 1000% $IMG

# lock the screen
i3lock -i $IMG

#while [ true ]; do
#    sleep 10
#    if [ $(pgrep i3lock | wc -l) -ne 0 ]; then
#        xset dpms force off
#    else :
#        exit 0
#    fi
#done
