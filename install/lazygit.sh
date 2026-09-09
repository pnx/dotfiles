#!/bin/bash
set -euo pipefail

VERSION=0.65.0
TARFILE=lazygit_${VERSION}_linux_x86_64.tar.gz
URL="https://github.com/jesseduffield/lazygit/releases/download/v${VERSION}/${TARFILE}"
PREFIX=/usr/local
WORKDIR="/tmp/lazygit-${VERSION}"

mkdir -p "$WORKDIR"
pushd "$WORKDIR" > /dev/null
[ -f "${TARFILE}" ] || wget -q "$URL"
[ -f "lazygit" ] || tar -xf "${TARFILE}"
sudo install -p -o root -g root -m 755 -t "$PREFIX/bin" lazygit
popd > /dev/null
