#!/bin/bash

if [ $# -lt 1 ]; then
    SELECTED=(core)
else
    SELECTED=$@
fi

for sel in "${SELECTED[@]}"; do
    case $sel in
        "core")
            sudo dnf install -y \
                fish \
                alacritty \
                tmux \
                xdg-utils \
                xsel \
                fzf
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
                picom \
                rofi \
                dunst \
                polybar \
                feh \
                lxappearance \
                ImageMagick \
                xautolock \
                xrandr \
                arandr \
                dejavu-fonts-all \
                fontawesome-fonts
            ;;
        *)
            echo "Unknown option: $sel"
            exit 1
            ;;
    esac
done

