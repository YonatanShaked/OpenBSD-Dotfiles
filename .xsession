#!/bin/sh

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/jdk-17/bin

ulimit -Sc 0

#wallpaper automation
xwallpaper --zoom "$HOME/.local/share/wallpaper.jpg"

xrdb /home/yoni/.config/x11/xresources & xrdbpid=$!

#thinkpad bindings
xinput set-prop "/dev/wsmouse" "Device Accel Constant Deceleration" 0.3
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

sndioctl output.level=1.0
sndioctl input.level=1.0

setxkbmap -layout us -option caps:super,altwin:menu_win

picom &
unclutter &
remaps &
dbus-uuidgen --ensure && dunst &
apmd
mpd &

ck-launch-session i3

