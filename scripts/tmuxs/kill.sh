#!/usr/bin/env bash
tmux kill-session -t $(echo $@ | sed 's/: .*//g')
