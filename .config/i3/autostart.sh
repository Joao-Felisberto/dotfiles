#!/bin/bash

export QT_QPA_PLATFORMTHEME=gtk2

killall -HUP xsettingsd
/usr/bin/xsettingsd &

~/scripts/brightness -l

~/.fehbg

setxkbmap pt

flameshot &
nm-applet &
