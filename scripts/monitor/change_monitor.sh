#!/bin/sh

monicon=$(cat ~/dotfiles/scripts/monitor/monicon.txt)

MONITOR_CHECK="$(~/dotfiles/scripts/monitor/check.sh)"

if [ "$monicon" = " " ]; then
    if [ "$MONITOR_CHECK" = "extern" ]; then
        EXTERN="DP-3"
        LAPTOP="eDP-1"
    else
        EXTERN="DP-1-3"
        LAPTOP="eDP-1-1"
    fi
    if xrandr --prop | grep -q "$EXTERN connected" ;then
        echo " " > ~/dotfiles/scripts/monitor/monicon.txt
        xrandr --output $EXTERN --auto --right-of $LAPTOP
        bspc desktop VSCode -m $EXTERN
        bspc desktop 5 -m $EXTERN
        bspc desktop 6 -m $EXTERN
        bspc desktop 7 -m $EXTERN
        bspc desktop 8 -m $EXTERN
        bspc desktop 9 -m $EXTERN
        bspc desktop 0 -m $EXTERN
        bspc desktop Desktop --remove
        feh --bg-center ~/Pictures/blue_wallpaper.jpg --bg-center ~/Pictures/blue_wallpaper_big.jpg
    fi
fi
if [ "$monicon" = " " ]; then
    if [ "$MONITOR_CHECK" = "extern" ]; then
        LAPTOP="eDP-1"
        EXTERN="DP-3"
    else
        LAPTOP="eDP-1-1"
        EXTERN="DP-1-3"
    fi
    if xrandr --prop | grep -q "$LAPTOP connected" ;then
        echo " " > ~/dotfiles/scripts/monitor/monicon.txt
        xrandr --output $LAPTOP --auto
        bspc desktop VSCode -m $LAPTOP
        bspc desktop 5 -m $LAPTOP
        bspc desktop 6 -m $LAPTOP
        bspc desktop 7 -m $LAPTOP
        bspc desktop 8 -m $LAPTOP
        bspc desktop 9 -m $LAPTOP
        bspc monitor $EXTERN -d 0 Desktop
        bspc desktop 0 -m $LAPTOP
        xrandr --output $EXTERN --off
    fi
fi

