#!/bin/bash

cat pnx-us-se.map | gzip | sudo tee /usr/share/kbd/keymaps/i386/qwerty/pnx-us-se.map.gz > /dev/null
sudo install pnx-us-se /usr/share/X11/xkb/symbols

sudo localectl --no-convert set-keymap pnx-us-se
sudo localectl --no-convert set-x11-keymap pnx-us-se
