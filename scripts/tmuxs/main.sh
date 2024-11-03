#!/usr/bin/env bash
BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))
source ${BASE_PATH}/.env

# Scripts
LIST_SESSIONS_SCRIPT=${BASE_PATH}/list-sessions.sh
KILL_SCRIPT=${BASE_PATH}/kill.sh


if [[ $# -eq 1 ]]; then
    if [[ "$1" == "-a" ]]; then
        selected=$($LIST_SESSIONS_SCRIPT | $FZF --bind "ctrl-d:execute(${KILL_SCRIPT} {})+reload(${LIST_SESSIONS_SCRIPT})" --border-label=Session | sed 's/: .*//g')
        ${BASE_PATH}/new.sh $selected
    else
        ${BASE_PATH}/new.sh $(realpath $1)
    fi
else
    ${BASE_PATH}/new.sh
fi

