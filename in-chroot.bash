#!/bin/bash

ls /usr/share/zoneinfo/

echo "Pick your region."
echo "↓"
read $region

ls /usr/share/zoneinfo/$region/

echo "Pick your city."
echo "↓"
read $city

ln -sf /usr/share/zoneinfo/$region/$city /etc/localtime

hwclock --systohc

locale-gen

echo "Uncomment your locales."
sleep 4
nano /etc/locale.gen

echo "What name do you want your computer to have?"
echo "↓"
read $pc

echo $pc >> /etc/hostname

echo "What name do you want to have?"
echo "↓"
read $username

useradd -m -G wheel -s /bin/bash $username

echo "Enter the password for the account."
passwd $username

echo "Enter the root password."
passwd root

systemctl enable dhcpcd.service

systemctl enable iwd.service

sudo systemctl enable NetworkManager.service

sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

echo "What processor do you have? (intel or amd)"
echo "↓"
read $ucode

pacman -S --noconfirm $ucode-ucode

echo "Installation complete! Type 'exit' to get out of chroot and then type 'reboot' to reboot the system."
sleep 6