#!/bin/bash

if [ $# -lt 1 ]; then
    SELECTED=(core)
else
    SELECTED=$@
fi

for sel in "${SELECTED[@]}"; do
    case $sel in
        "core")
            sudo dnf install -y dnf-plugins-core
            sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

            sudo dnf install -y \
                fish \
                alacritty \
                tmux \
                xdg-utils \
                xsel \
                brave-browser \
                fzf
            ;;
        "nvim")
            sudo dnf install -y \
                ripgrep \
                fswatch \
                fd-find \
                neovim
            ;;
        "hypr")
            sudo dnf copr enable lionheartp/Hyprland
            sudo dnf install -y \
                uwsm \
                sddm \
                hyprland \
                hyprpaper \
                rofi \
                dunst \
                waybar
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

