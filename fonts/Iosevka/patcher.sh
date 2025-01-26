#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

TMP_DIR=${BASE_PATH}/.patcher
SCRIPT_FILE="$TMP_DIR/font-patcher"
URL=https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
ZIP_FILE=patcher.zip

if [ ! -f $SCRIPT_FILE ];then
    mkdir $TMP_DIR

    if [ ! -f "$TMP_DIR/$ZIP_FILE" ]; then
        curl -L -o "$TMP_DIR/$ZIP_FILE" ${URL}
    fi

    unzip "$TMP_DIR/$ZIP_FILE" -d $TMP_DIR
fi

for font in ${BASE_PATH}/dist/IosevkaCustom-*.ttf; do
    $SCRIPT_FILE -out ${BASE_PATH}/dist -c $font
done

