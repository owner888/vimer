#!/bin/bash

if [ ! -n "$1" ] ;then
    gvim -p --remote-tab-silent nofile
else
    gvim -p --remote-tab-silent $1
fi
