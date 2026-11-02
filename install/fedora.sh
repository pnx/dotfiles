#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))
SCRIPT_PATH="${BASE_PATH}/fedora"

if [ $# -lt 1 ]; then
    SELECTED=(core)
else
    SELECTED=$@
fi

for sel in "${SELECTED[@]}"; do
    if [ -f "${SCRIPT_PATH}/${sel}.sh" ]; then
        echo -e "\033[32;1m *\033[0m ${sel}"
        source "${SCRIPT_PATH}/${sel}.sh"
    else :
        echo "Invalid script '${sel}'"
    fi
done

