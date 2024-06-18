#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

DIRECTORIES=(
    nvim
    fish
    alacritty
    hypr
    waybar
    wofi
    #i3
    #i3status
    #rofi
    smartgit
    lazygit
)

for target in ${DIRECTORIES[@]}; do
    ln -sfr -t $HOME/.config $BASE_PATH/$target
done

ln -sfr $BASE_PATH/tmux.conf $HOME/.tmux.conf
ln -sfr $BASE_PATH/Xresources $HOME/.Xresources

mkdir -p $HOME/bin
for script in $(find $BASE_PATH/scripts -type f); do
    ln -sfr $script $HOME/bin/$(basename $script)
done
