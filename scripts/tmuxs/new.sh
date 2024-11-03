#!/usr/bin/env bash
BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))
source ${BASE_PATH}/.env

if [[ $# -eq 1 ]]; then
    selected=$1
else 
    DIRECTORIES=$(cat ~/.tmuxs | sed "s&^\~&${HOME}&g")
    selected=$(find ${DIRECTORIES} -mindepth 1 -maxdepth 1 -type d | $FZF --border-label="New Session")
    if [[ -z $selected ]]; then
        exit 0
    fi
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name

