#!/bin/bash

LAPTOP=eDP-1
LAPTOP_GPU=eDP-1-1
EXTERN=DP-3
EXTERN_GPU=DP-1-3

if xrandr --prop | grep -q "$EXTERN connected" ;then
    echo -e "extern"
elif xrandr --prop | grep -q "$EXTERN_GPU connected" ;then
    echo -e "extern-gpu"
elif xrandr --prop | grep -q "$LAPTOP connected" ;then
    echo -e "laptop"
elif xrandr --prop | grep -q "$LAPTOP_GPU connected" ;then
    echo -e "laptop-gpu"
else
    echo -e ":("
fi
