#!/usr/bin/env bash

SESSION=$(echo $@ | sed 's/: .*//g')
CURRENT=$(tmux list-sessions -F "#{session_name}" -f "#{session_attached}" | head -n 1)

# If we are killing the current session. Move to another
if [ "$CURRENT" == "$SESSION" ]; then
    NEXT=$(tmux list-sessions -F "#{session_name}" -f "#{==:#{session_attached},0}" | head -n 1)
    if [ ! -z "$NEXT" ]; then
        tmux switch -t "${NEXT}"
    fi
fi

tmux kill-session -t "$SESSION"
