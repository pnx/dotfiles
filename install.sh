#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

DIRECTORIES=(
    nvim
    fish
    #alacritty
    #ghostty
    kitty
    #hypr
    #waybar
    #wofi
    i3
    polybar
    #i3status
    rofi
    dunst
    smartgit
    lazygit
    tmux-plugins
)

for target in ${DIRECTORIES[@]}; do
    ln -sfr -t $HOME/.config $BASE_PATH/$target
done

ln -sfr $BASE_PATH/bash/bashrc $HOME/.bashrc
ln -sfr $BASE_PATH/bash/bashrc.d $HOME/.bashrc.d
ln -sfr $BASE_PATH/tmux.conf $HOME/.tmux.conf
ln -sfr $BASE_PATH/Xresources $HOME/.Xresources
ln -sfr $BASE_PATH/picom.conf $HOME/.config/picom.conf
ln -sfr $BASE_PATH/fzfrc $HOME/.config/fzfrc

mkdir -p $HOME/bin
ln -sfr $BASE_PATH/scripts/tmuxs/main.sh $HOME/bin/tmuxs
for script in $(find $BASE_PATH/scripts -maxdepth 1 -type f); do
    ln -sfr $script $HOME/bin/$(basename $script)
done
