#!/bin/bash

sudo pacman -S --needed linux-docs khotkeys plasma-firewall ttf-liberation linux-tools-meta plymouth-kcm linux-lts-docs kde-gtk-config plasma-workspace-wallpapers yakuake  
sleep 2
sudo pacman -S --needed plasma-browser-integration kinfocenter breeze-plymouth unzip kdeplasma-addons plasma-vault powerdevil plasma-thunderbolt xdg-desktop-portal-kde plasma-disks breeze-gtk xarchiver man-db man-pages tldr 
sleep 2

# Delete "debug" from the line OPTIONS in /etc/makepkg.conf: 
echo " "
echo "Delete <debug> from the line OPTIONS"
sleep 5
sudo nano /etc/makepkg.conf

# Paket-Manager "yay" installieren:
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Hinweis: Die Verwendung von "yay" kann potenziell unsicher sein, da es Pakete außerhalb der offiziellen Repositories installiert. Verwenden Sie es mit Vorsicht!

#sleep 5

# Update the databases, repositories and the whole system
sudo pacman -Syu && yay


# Google Chrome installieren
yay -S google-chrome

# Microsoft Fonts installieren:
yay -S ttf-ms-fonts

# Timeshift für System-Snapshots installieren:
yay -S timeshift

# qt5-webkit für bestimmte Anwendungen:
yay -S qt5-webkit

# Similar to tldr, cheat provides short and to-the-point summaries of various Linux commands and tools:
yay -S cheat

