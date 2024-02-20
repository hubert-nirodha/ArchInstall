#!/bin/bash

# iwd aktivieren
systemctl enable iwd.service
systemctl start iwd.service
iwctl
sleep 3
# automatic configuration of the network adapter, troubleshooting network problems, and logging DHCP activities
dhcpcd

# Creates a new user "nirodha" with the specified group memberships and shell
useradd -m -g users -G wheel,power,video,network,storage,audio,optical,scanner,rfkill -s /bin/bash nirodha

# Sets the password for the user "nirodha"
passwd nirodha

# Installs 67 applications and packages listed after the command
pacman -S acpid cups 

# Sets the default text editor for editing the sudoers file to nano
EDITOR=nano visudo

# Tastaturbelegung fuer Wayland setzen
localectl set-x11-keymap de pc105 nodeadkeys

# Systemdienste aktivieren
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable cups.service
systemctl enable --now systemd-timesyncd.service
#systemctl enable bluetooth
# fstrim Timer aktivieren für automatische Dateisystem-Defragmentierung:
systemctl enable fstrim.timer

pacman -S wayland xorg-xwayland xorg-xlsclients qt5-wayland plasma-wayland-session plasma-desktop  plasma-pa bluedevil bluez bluez-libs bluez-tools bluez-utils sddm sddm-kcm plasma-nm bluez-plugins

# SDDM Konfiguration anpassen
# -> Ueberpruefe, ob der Abschnitt "[General]" existiert
#grep -q '^\[General\]$' /etc/sddm.conf || echo "[General]" >> /etc/sddm.conf
# -> Setze die Standard-Session auf Plasma Wayland
#sed -i 's/^DefaultSession=.*/DefaultSession=plasma.wayland/' /etc/sddm.conf
nano /etc/sddm.conf


# SDDM aktivieren
systemctl enable sddm

# iwd deaktivieren
systemctl stop iwd.service
systemctl disable iwd.service

# NetworkManager aktivieren
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
sleep 3
# System neustarten:
echo " " 
echo " "
echo " "
echo " Reboote das system jetzt!"

