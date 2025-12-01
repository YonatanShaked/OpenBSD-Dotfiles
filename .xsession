#!/bin/sh

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/jdk-17/bin

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct

ulimit -Sc 0

xrdb -merge "$HOME/.config/x11/xresources"

#wallpaper automation
xwallpaper --zoom "$HOME/.local/share/wallpaper.jpg"

#thinkpad bindings
xinput set-prop "/dev/wsmouse" "Device Accel Constant Deceleration" 0.3
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

sndioctl output.level=1.0
sndioctl input.level=1.0

setxkbmap -layout us
xsetroot -cursor_name left_ptr

picom &
unclutter &
remaps &
dunst &
apmd -A &
mpd &

exec bspwm

