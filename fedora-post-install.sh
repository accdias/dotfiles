#!/bin/bash
# Give virt-manager permissions for wheel group
cat << EOF >/etc/polkit-1/localauthority/50-local.d/50-org.virtman-libvirt-local-access.pkla
[Allow group virtman libvirt management permissions]
Identity=unix-group:wheel
Action=org.libvirt.unix.manage
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF
restorecon -F /etc/polkit-1/localauthority/50-local.d/50-org.virtman-libvirt-local-access.pkla

# Enable tap-to-click on GDM (logon screen)
#su - gdm -s /bin/bash
#export $(dbus-launch)
#GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Fix Google Chrome download icons
dnf install -y gnome-icon-theme.noarch gnome-icon-theme-extras.noarch elementary-icon-theme.noarch

# Install extra packages
dnf install -y tmate tlp tlp-rdw icedtea-web
systemctl enable tlp.service

# Change default I/O scheduler
cat << EOF >/etc/udev/rules.d/60-io-scheduler.rules
# set deadline scheduler for non-rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="noop"
# set deadline scheduler for rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="deadline"
EOF
restorecon -F /etc/udev/rules.d/60-io-scheduler.rules

# Workaround for touchpad phantom tap-clicks
cat << EOF > /etc/udev/rules.d/90-psmouse.rules
ACTION=="add|change", SUBSYSTEM=="module", DEVPATH=="/module/psmouse", ATTR{parameters/synaptics_intertouch}="0"
EOF
restorecon -F /etc/udev/rules.d/90-psmouse.rules

# Configure trackpoint for scrolling when combined with physical middle button
cat << EOF > /etc/X11/xorg.conf.d/90-trackpoint.conf
Section "InputClass"
    Identifier "Trackpoint Scrolling"
    MatchProduct "TPPS/2 IBM TrackPoint"
    MatchDevicePath "/dev/input/event*"
    # Configure wheel emulation, using middle button and "natural scrolling".
    Option "EmulateWheel" "on"
    Option "EmulateWheelButton" "2"
    Option "EmulateWheelTimeout" "200"
    Option "EmulateWheelInertia" "7"
    Option "XAxisMapping" "7 6"
    Option "YAxisMapping" "5 4"
    # Set up an acceleration config ("mostly linear" profile, factor 5.5).
    Option "AccelerationProfile" "3"
    Option "AccelerationNumerator" "55"
    Option "AccelerationDenominator" "10"
    Option "ConstantDeceleration" "3"
EndSection
EOF
restorecon -F /etc/X11/xorg.conf.d/90-trackpoint.conf

#for key in $(gsettings list-keys org.gnome.desktop.peripherals.touchpad); do echo -n "$key: "; gsettings get org.gnome.desktop.peripherals.touchpad $key; done
#send-events: 'enabled'
#natural-scroll: true
#tap-to-click: true
#two-finger-scrolling-enabled: true
#left-handed: 'mouse'
#click-method: 'fingers'
#speed: 0.0
#tap-and-drag: false
#edge-scrolling-enabled: false
#disable-while-typing: true


# End of file