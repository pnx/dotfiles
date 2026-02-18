#!/bin/bash
BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

VC_DIR=/usr/share/kbd/keymaps/i386/qwerty
if [ ! -d "$VC_DIR" ];then
    VC_DIR=/usr/lib/kbd/keymaps/xkb
fi

cat $BASE_PATH/pnx-us-se.map | gzip | sudo tee ${VC_DIR}/pnx-us-se.map.gz > /dev/null
ln -sfr $(realpath $BASE_PATH/../xkb) $HOME/.config/

sudo localectl --no-convert set-x11-keymap pnx-us-se
sudo localectl --no-convert set-keymap pnx-us-se
