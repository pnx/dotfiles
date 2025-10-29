#!/bin/bash

OPTS="list-sessions -F #{session_name}"

## If we are inside tmux already, don't list active sessions
if [[ ! -z $TMUX ]]; then 
    OPTS="${OPTS} -f #{==:#{session_attached},0}"
fi

tmux ${OPTS}

