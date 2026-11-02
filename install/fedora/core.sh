#!/bin/bash

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
