#!/bin/bash

sleep 2

sudo pacman -Syuu --noconfirm

echo "What kernel do you want? (-lts, -hardened, -zen, or leave blank for normal)"
echo "↓"
read $ver

pacstrap /mnt base linux$ver linux-firmware grub git efibootmgr dhcp dhcpcd sudo networkmanager iwd zsh nano vim vim-runtime base-devel network-manager vi --noconfirm

genfstab -p -U /mnt >> /mnt/etc/fstab

echo "Entering arch-chroot."

cp -v in-chroot.bash /mnt/in-chroot.bash

arch-chroot /mnt ./in-chroot.bash