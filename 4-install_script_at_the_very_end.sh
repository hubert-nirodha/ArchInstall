#!/bin/bash

sudo pacman -S --needed pipewire-pulse pipewire-audio 
sleep 2
sudo pacman -S linux-docs khotkeys plasma-firewall ttf-liberation linux-tools-meta plymouth-kcm linux-lts-docs kde-gtk-config plasma-workspace-wallpapers yakuake  
sleep 2
sudo pacman -S plasma-browser-integration kinfocenter breeze-plymouth unzip kdeplasma-addons plasma-vault powerdevil plasma-thunderbolt xdg-desktop-portal-kde plasma-disks breeze-gtk xarchiver 
sleep 2

#sudo su - nirodha
#sleep 2
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

