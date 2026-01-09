#!/bin/bash

LN="ln -snfr"
BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

DIRECTORIES=(
    nvim
    fish
    bat
    alacritty
    i3
    polybar
    rofi
    lazygit
)

for target in ${DIRECTORIES[@]}; do
    $LN -t $HOME/.config $BASE_PATH/$target
done

$LN $BASE_PATH/bash/bashrc $HOME/.bashrc
$LN $BASE_PATH/bash/bashrc.d/ $HOME/.bashrc.d
$LN $BASE_PATH/tmux/config.conf $HOME/.tmux.conf
$LN $BASE_PATH/xinitrc $HOME/.xinitrc
$LN $BASE_PATH/picom.conf $HOME/.config/picom.conf
$LN $BASE_PATH/fzfrc $HOME/.config/fzfrc
$LN $BASE_PATH/git/config $HOME/.gitconfig
$LN $BASE_PATH/git/conf.d/ $HOME/.config/git

if [ ! -f "$HOME/.Xresources" ]; then
    cp $BASE_PATH/Xresources $HOME/.Xresources
fi

mkdir -p $HOME/bin
$LN $BASE_PATH/scripts/tmuxs/main.sh $HOME/bin/tmuxs
for script in $(find $BASE_PATH/scripts -maxdepth 1 -type f); do
    $LN $script $HOME/bin/$(basename $script)
done
