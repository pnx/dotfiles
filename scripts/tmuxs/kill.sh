#!/usr/bin/env bash
BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))
source ${BASE_PATH}/helpers.sh

SESSION=$(echo $@ | get_session_name)

# If we are killing the current session. Move to another
if [ "$(current_session)" == "$SESSION" ]; then
    NEXT=$(list_sessions | grep -v "${SESSION}" | head -n 1 | get_session_name)
    if [ ! -z "$NEXT" ]; then
        tmux switch -t "${NEXT}"
    fi
fi

tmux kill-session -t "$SESSION"
