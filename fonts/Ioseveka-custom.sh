#!/bin/bash

BASE_URL=https://raw.githubusercontent.com/pnx/Iosevka-custom/main/dist
INSTALL_DIR=~/.local/share/fonts

FONTS=(
    IosevkaCustom-Regular.ttf
    IosevkaCustom-SemiBold.ttf
    IosevkaCustomNerdFont-Regular.ttf
    IosevkaCustomNerdFont-SemiBold.ttf
)

for font in ${FONTS[@]}; do
    echo "Installing ${font} to '${INSTALL_DIR}/${font}'"
    curl -L -o "${INSTALL_DIR}/${font}" "${BASE_URL}/${font}"
done


