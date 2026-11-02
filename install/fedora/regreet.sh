#!/bin/bash

sudo useradd --system --user-group --no-create-home \
  --home-dir /nonexistent --shell /sbin/nologin greeter

sudo dnf install -y dnf-plugins-core
sudo dnf copr enable pocketblue/extra
sudo dnf install -y greetd regreet cage
