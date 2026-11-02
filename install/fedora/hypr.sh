#!/bin/bash

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
