#!/bin/bash

# **This script automates the initial setup of a new Arch Linux installation
# within a chroot environment, specifically configuring KDE Plasma as the
# desktop environment and creating two boot entries, one for the latest kernel
# and one for the LTS kernel, each with a corresponding fallback entry.
# Please ensure you have chrooted into the target system before running this script.**

# Set hostname
echo "nirodha-pc" > /etc/hostname

# Configure keyboard layout and font
echo "KEYMAP=de-latin1-nodeadkeys" > /etc/vconsole.conf
echo "FONT=ter-132b" >> /etc/vconsole.conf

# Set locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set timezone
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Edit Pacman configuration (manually in nano editor)
nano /etc/pacman.conf
# Uncomment the multilib repository in /etc/pacman.conf automatically
#sed -i 's/#\[multilib\]/\[multilib\]/' /etc/pacman.conf
#sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf


# Synchronize package lists and generate initial ramdisk image
pacman -Sy
mkinitcpio -p linux
sleep 2
# Set root password
passwd

# Install additional packages
pacman -S efibootmgr dosfstools gptfdisk reflector exa fzf
sleep 2
# Install and update boot entries
bootctl install

# Create boot entries for both latest and LTS kernels with KDE Plasma
cat << EOF >> /boot/loader/entries/arch-uefi.conf
# Boot entry for latest kernel with KDE Plasma
title Arch Linux KDE Plasma
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=LABEL=ROOT rw lang=de init=/usr/lib/systemd/systemd locale=en_US.UTF-8
EOF

cat << EOF >> /boot/loader/entries/arch-uefi-fallback.conf
# Fallback entry for latest kernel with recovery mode options
title Fallback (recovery mode)
linux /vmlinuz-linux
initrd /initramfs-linux-fallback.img
options root=LABEL=ROOT rw lang=de init=/usr/lib/systemd/systemd locale=en_US.UTF-8
EOF

cat << EOF >> /boot/loader/entries/arch-lts-uefi.conf
title Arch Linux LTS
linux /vmlinuz-linux-lts
initrd /initramfs-linux-lts.img
options root=LABEL=ROOT rw lang=de init=/usr/lib/systemd/systemd locale=en_US.UTF-8
EOF

cat << EOF >> /boot/loader/entries/arch-lts-uefi-fallback.conf
title  LTS Fallback (recovery mode)
linux  /vmlinuz-linux-lts
initrd  /initramfs-linux-lts-fallback.img
options root=LABEL=ROOT rw lang=de init=/usr/lib/systemd/systemd locale=en_US.UTF-8
EOF

# Set bootloader configuration
cat << EOF > /boot/loader/loader.conf
default arch-uefi.conf
timeout 3
EOF

bootctl update

# clear and wait 5 seconds before saving commands in a text file
#clear
echo "Unmount and reboot to start the 3. installation script!"

#echo "Used commands will be saved in /home/cmds_during_chroot.txt"
#history | wc -l > /home/cmds_during_chroot.txt
#history > /home/cmds_during_chroot.txt
sleep 5
exit
