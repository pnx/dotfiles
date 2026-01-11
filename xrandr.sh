#!/bin/bash

# xrandr --output eDP-1 --mode 1920x1080 --pos 3440x0 --rotate normal \
#     --output DP-1-0 --off \
#     --output DP-1-1 --off \
#     --output DP-1-2 --off \
#     --output DP-1-3 --off \
#     --output HDMI-1-0 --primary --mode 3440x1440 --pos 0x0 --rotate normal \
#     --output DP-1-4 --off

xrandr \
    --output HDMI-0 --mode 1920x1080 --pos 760x0 --rotate normal \
    --output DP-2 --primary --mode 3440x1440 --pos 0x1080 --rotate normal
