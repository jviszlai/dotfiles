#!/bin/sh

monicon=$(cat ~/dotfiles/scripts/monitor/monicon.txt)

MONITOR_CHECK="$(~/dotfiles/scripts/monitor/check.sh)"

if [ "$monicon" = " " ]; then
    if [ "$MONITOR_CHECK" = "laptop" ]; then
        EXTERN="DP-3"
    else
        EXTERN="DP-1-3"
    fi
    if xrandr --prop | grep -q "$EXTERN connected" ;then
        echo " " > ~/dotfiles/scripts/monitor/monicon.txt
        xrandr --output $EXTERN --auto
        bspc monitor $EXTERN --remove
    fi
fi
if [ "$monicon" = " " ]; then
    if [ "$MONITOR_CHECK" = "extern" ]; then
        LAPTOP="eDP-1"
    else
        LAPTOP="eDP-1-1"
    fi
    if xrandr --prop | grep -q "$LAPTOP conected" ;then
        echo " " > ~/dotfiles/scripts/monitor/monicon.txt
        xrandr --output $LAPTOP --auto
    fi
fi

