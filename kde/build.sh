#!/bin/sh
sed -f Variables.sed Template.colors | sed -f Variables.sed > Custom.colors
