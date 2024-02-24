#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

DIRECTORIES=(
	fish
	kitty
	i3
	i3status
	rofi
	smartgit
)

for target in ${DIRECTORIES[@]}; do
	ln -sfr -t $HOME/.config $BASE_PATH/$target
done
