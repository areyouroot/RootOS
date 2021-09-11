#!/bin/bash

echo -e "run this script with arch linux iso from https://archlinux.org/ \n or else run this with your own risk"
echo -e "\n\n before running this script make sure that u have a internet connection\n this script doesnt support swap etc...\n to know more read the script"

ping -c 3 1.1.1.1

timedatectl set-ntp true #Enable Network Time Protocols 
timedatectl status #

#Partition the Disks

fdisk -l 

echo "enter your disk to be selected  "

read disk

echo -e "now u need to manually partition your disk \n enter any thing and press enter to continue"

read verify

cfdisk

mkfs.ext4 $disk"1"

mount $disk"1" /mnt

pacman -Syy
pacman -Fyy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware





