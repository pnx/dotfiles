#!/bin/bash

function current_session {
    tty=$(tty)
    for s in $(tmux list-sessions -F '#{session_name}' 2>/dev/null); do
        tmux list-panes -F '#{pane_tty} #{session_name}' -t "$s"
    done | grep "$tty" | awk '{print $2}'
}

function list_sessions {
    tmux list-sessions -F "#{session_activity},#{session_id},#{session_name}" \
        | sort -nr | cut -d, -f2,3 | format_session_string
}

# Given the input "#{session_id},#{session_name}" from tmux ($7,my_session for example)
# will output <id>: <name (7: my_session)
function format_session_string {
    sed -r 's/^\$([[:digit:]]+),/\1: /'
}

# Extract the name part from the input (format "<id>: <name>")
function get_session_name {
    sed 's/[[:digit:]]\+\:\s//'
}
