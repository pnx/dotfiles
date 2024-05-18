#!/bin/bash

if [ $# -lt 1 ]; then
    echo "usage: $0 <formatter>"
    exit 1
fi
SELECTED=$@

for sel in "${SELECTED[@]}"; do
    case $sel in
    "shfmt")
        go install mvdan.cc/sh/v3/cmd/shfmt@latest
        ;;
    "prettier")
        sudo npm install -g prettier
        ;;
    "stylua")
        curl -sL https://github.com/JohnnyMorganz/StyLua/releases/download/v0.20.0/stylua-linux-x86_64.zip |
            funzip |
            sudo tee /usr/local/bin/stylua >/dev/null |
            sudo chmod 755 /usr/local/bin/stylua
        ;;
    "blade")
        sudo npm install -g blade-formatter
        ;;
    *)
        echo "Unknown option: $sel"
        exit 1
        ;;
    esac
done
