#!/bin/bash

read $disk

echo "You will now need to enter a root partition (ext4), a swap partition (swap), and a EFI Partition. (EFI)"
sleep 6
cfdisk $disk

echo "What was your root partition? (e.g. /dev/sda1)"
echo "↓"
read $p1

echo "What was your swap partition? (e.g. /dev/sda2)"
echo "↓"
read $p2

echo "What was your EFI partition? (e.g. /dev/sda3)"
echo "↓"
read $p3

echo "Write the disk where the partitions are on a piece of paper. (e.g. /dev/sda)"

mkfs.ext4 /dev/$p1

mkswap $p2

mkfs.fat -F 32 /dev/$p3

mount $p1 /mnt

mount --mkdir $p3 /mnt/boot

swapon $p2