#!/bin/bash

# include session_activity to use for sorting
OPTS="list-sessions -F #{session_activity},#{session_id},#{session_name}"

## If we are inside tmux already, don't list active sessions
# if [[ ! -z $TMUX ]]; then 
#     OPTS="${OPTS} -f #{==:#{session_attached},0}"
# fi

tmux ${OPTS} | sort -nr | cut -d, -f2,3 | sed -r 's/^\$([[:digit:]]+),/\1: /'

