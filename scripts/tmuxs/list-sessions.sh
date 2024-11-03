#!/bin/bash

# if [[ ! -z $TMUX ]]; then 
#     tmux list-sessions -F '#{?session_attached,,#{session_name}}' | grep '\S'
# else
    tmux list-sessions -F '#{session_name}'
# fi

