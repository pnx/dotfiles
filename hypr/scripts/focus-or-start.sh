#!/bin/sh

execCommand=$1
className=$2

class=$(hyprctl -j clients | jq -r ".[] | select(.class | startswith(\"${className}\")) | .class")

if [[ $class != "" ]]
then
	hyprctl dispatch focuswindow "class:${class}"
else
	${execCommand} &
fi
