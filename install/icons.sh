#!/bin/bash

ICON=fedora
TMPDIR=~/.qogir-icon-install

mkdir -p $TMPDIR
git clone https://github.com/vinceliuice/Qogir-icon-theme $TMPDIR

pushd $TMPDIR
sudo ./install.sh -t default -c dark -d /usr/share/icons
popd

pushd $TMPDIR/src/cursors
sudo cp -r dist/ /usr/share/icons/Qogir-cursors
popd

sudo rm -fr $TMPDIR
