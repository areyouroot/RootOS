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
pacstrap /mnt base linux linux-firmware xorg sddm plasma kde-applications sudo nano
genfstab -U /mnt >> /mnt/etc/fstab
echo "enter the new user name : "
read new_user
echo $new_user > /mnt/etc/hostname
touch /mnt/etc/hosts
echo -e "127.0.0.1 localhost \n::1 localhost\n127.0.1.1 user" >> /mnt/etc/hosts
echo "enter the root password"
arch-chroot /mnt passwd
arch-chroot /mnt pacman -Syy grub os-prober
arch-chroot /mnt grub-install $disk
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

arch-chroot /mnt useradd -m $new_user
arch-chroot /mnt passwd $new_user
sed '/root ALL=(ALL) ALL/s/$/ \n'$new_user'ALL=(ALL) ALL\n&/' /mnt/etc/sudoers > /mnt/etc/sudoers
arch-chroot /mnt systemctl enable sddm
arch-chroot /mnt systemctl enable NetworkManager
sed '/Current=/s/$/ \nbreeze\n&/' /mnt/usr/lib/sddm/sddm.conf.d/default.conf > /mnt/usr/lib/sddm/sddm.conf.d/default.conf
echo "your os has been installed u can reboot now and boot into the existing os"






