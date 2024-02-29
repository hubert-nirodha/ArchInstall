#!/bin/bash

sudo pacman -S --needed pipewire-pulse pipewire-audio konsole dolphin dolphin-plugins kate pacman-contrib firefox
sleep 2
sudo pacman -S linux-docs khotkeys plasma-firewall ttf-liberation linux-tools-meta plymouth-kcm linux-lts-docs kde-gtk-config plasma-workspace-wallpapers yakuake  
sleep 2
sudo pacman -S plasma-browser-integration kinfocenter breeze-plymouth unzip kdeplasma-addons plasma-vault powerdevil plasma-thunderbolt xdg-desktop-portal-kde plasma-disks breeze-gtk xarchiver 
sleep 2

# Chaotic AUR einrichten (VORSICHT: Experimentelles Repository!)

# Schlüssel für Chaotic AUR hinzufügen:
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

# Chaotic AUR Paketquellen hinzufügen:
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Pacman Konfiguration anpassen (Chaotic-AUR Repository ans Ende der pacman.conf Datei hinzufügen):
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

#sudo su - nirodha
sleep 2
# Paket-Manager "yay" installieren:
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si

# Hinweis: Die Verwendung von "yay" kann potenziell unsicher sein, da es Pakete außerhalb der offiziellen Repositories installiert. Verwenden Sie es mit Vorsicht!

#sleep 5

# Update the databases, repositories and the whole system
pacman -Syu

# Microsoft Fonts installieren:
#yay -s ttf-ms-fonts

#yay -S mesa-git

# Timeshift für System-Snapshots installieren:
#yay -S timeshift

# qt5-webkit für bestimmte Anwendungen:
#yay -S qt5-webkit

