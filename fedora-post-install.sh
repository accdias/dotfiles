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

# Enable tap-to-click on GDM (logon screen)
#su - gdm -s /bin/bash
#export $(dbus-launch)
#GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Fix Google Chrome download icons
sudo dnf install -y gnome-icon-theme.noarch gnome-icon-theme-extras.noarch elementary-icon-theme.noarch

# Install extra packages
sudo dnf install -y tmate tlp tlp-rdw
sudo systemctl enable tlp.service

# Change default I/O scheduler
cat << EOF >/etc/udev/rules.d/60-io-scheduler.rules
# set deadline scheduler for non-rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="noop"
# set deadline scheduler for rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="deadline"
EOF

# End of file