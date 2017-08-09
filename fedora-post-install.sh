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
sudo dnf install -y tmate