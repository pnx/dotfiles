#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

sudo cp $BASE_PATH/../keymaps/pnx-us-se /usr/share/X11/xkb/symbols/
