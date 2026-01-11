#!/bin/bash

BASE_PATH=$(dirname $(readlink -f $BASH_SOURCE))

sudo tar -C /usr/share/icons -xvf ${BASE_PATH}/../assets/qogir-icons.tar.gz
sudo tar -C /usr/share/icons -xvf ${BASE_PATH}/../assets/qogir-cursors.tar.gz
