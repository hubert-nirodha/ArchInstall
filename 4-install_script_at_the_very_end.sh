#!/bin/bash

sudo pacman -S --needed linux-docs khotkeys plasma-firewall ttf-liberation linux-tools-meta plymouth-kcm linux-lts-docs kde-gtk-config plasma-workspace-wallpapers yakuake  
sleep 2
sudo pacman -S --needed plasma-browser-integration kinfocenter breeze-plymouth unzip kdeplasma-addons plasma-vault powerdevil plasma-thunderbolt xdg-desktop-portal-kde plasma-disks breeze-gtk xarchiver man-db man-pages tldr 
sleep 2
sudo pacman -S tree bat kde-cli-tools kdegraphics-thumbnailers kdesdk-thumbnailers ffmpegthumbs taglib kde-thumbnailer-apk 
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




### Zusätzliche Pakete: qt5-tools (enthält z.B. den qdbusviewer)
### installiere und konfiguriere KDE Plasma mit plasmashel, kpackagetool5, kwriteconfig5 ...
### It's possible to inspect various APIs using qdbusviewer tool from qt-tools package. For example, I can click on showText method to display a message. The CLI command for the same action will be:
qdbus-qt5 org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText "" "TEST!"
### You can see that it's essentially the same path that's on the screenshot with "" and "TEST!" being the arguments to showText function.
### This command will display a message with "TEST!" text (the first argument is an icon, empty in this case)
### To kill and restart plasma:
kquitapp5 plasmashell && kstart5 plasmashell
