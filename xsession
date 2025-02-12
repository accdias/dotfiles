# dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
xrandr --output DP-1 --dpi 82
