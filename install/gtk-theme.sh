#!/bin/bash

ICON=fedora
TMPDIR=~/.qogir-theme-install

mkdir -p $TMPDIR
git clone https://github.com/vinceliuice/Qogir-theme.git $TMPDIR

pushd $TMPDIR
sudo ./install.sh -i $ICON -d /usr/share/themes
popd

rm -fr $TMPDIR
