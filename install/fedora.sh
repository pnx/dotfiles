#!/bin/bash

if [ $# -lt 1 ]; then
    SELECTED=(core i3)
else 
    SELECTED=$@
fi

for sel in "${SELECTED[@]}"; do
    case $sel in
        "core")
            sudo dnf install -y \
                xsel \
                fish \
                kitty \
                tmux \
                xsel \
                fzf \
                fswatch
            ;;
        "nvim")
            sudo dnf install -y \
                ripgrep \
                fswatch \
                fd-find \
                neovim
            ;;
        "i3")
            sudo dnf install -y \
                xorg-x11-xinit \
                i3 \
                lxappearance \
                ImageMagick \
                xautolock \
                xrandr \
                arandr \
                rofi \
                dejavu-fonts-all \
                fontawesome-fonts
            ;;
        *)
            echo "Unknown option: $sel"
            exit 1
            ;;
    esac
done

