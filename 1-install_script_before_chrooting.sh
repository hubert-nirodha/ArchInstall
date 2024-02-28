#!/bin/bash
#loadkeys de-latin1
#setfont ter-132b
#ping -c3 archlinux.org
timedatectl set-ntp true

# Partitionierung und Dateisysteme:

# Festplattenbezeichnung
#DEVICE="/dev/nvme0n1"

# Partitionsgrößen
#EFI_SIZE=1024M
#ROOT_SIZE=50G
#HOME_SIZE=700G
#SWAP_SIZE="32000M"

# Partitionierung mit sgdisk
sgdisk --zap-all /dev/nvme0n1

# EFI-Partition erstellen
sgdisk -n 1:0:1G -c 1:EFIBOOT -t 1:EF00 /dev/nvme0n1

# ROOT-Partition erstellen
sgdisk -n 2:0:+50G -c 2:ROOT -t 2:8300 /dev/nvme0n1

# HOME-Partition erstellen
sgdisk -n 3:0:+700G -c 3:HOME -t 3:8300 /dev/nvme0n1

echo " "
echo " "
echo " "
lsblk
# Swap-Datei erstellen
#dd if=/dev/zero of=/swapfile bs=1M count=$SWAP_SIZE

# Dateisystemformatierung
mkfs.fat -F32 -n EFIBOOT /dev/nvme0n1p1
mkfs.ext4 -L ROOT /dev/nvme0n1p2
mkfs.ext4 -L HOME /dev/nvme0n1p3

# Swap-Datei aktivieren
#mkswap /swapfile
#swapon /swapfile

# Mounten der Partitionen
mount -L ROOT /mnt
mkdir /mnt/home
mount -L HOME /mnt/home
mkdir -p /mnt/boot
mount -L EFIBOOT /mnt/boot
lsblk
sleep 2
reflector --verbose -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-lts linux-firmware linux-headers linux-lts-headers nano dhcpcd iwd dialog intel-ucode bash-completion git
genfstab -Up /mnt > /mnt/etc/fstab
#cat .zsh_history > /mnt/home/cmds_before_chrooting.txt
#clear
cat /mnt/etc/fstab
echo " "
echo " "
echo " 'arch-chroot /mnt' and run ./2-install_script_during_chrooting.sh "
