#!/bin/bash

echo -e "run this script with arch linux iso from https://archlinux.org/ \n or else run this with your own risk"
echo -e "\n\n before running this script make sure that u have a internet connection\n this script doesnt support swap etc...\n to know more read the script"

ping -c 3 1.1.1.1  #showing the internet connectivity

timedatectl set-ntp true #Enable Network Time Protocols 
timedatectl status #

#Partition the Disks

clear

fdisk -l 

echo -e "\n \nenter your disk to be selected  "

read disk

echo -e "\n\nnow u need to manually partition your disk \n enter any thing and press enter to continue"

read verify

cfdisk #creating a disk partition

clear

mkfs.ext4 $disk"1"

mount $disk"1" /mnt  #mounting the ur disk

pacman -Syy #updating and pacman and installing things temporvary in archlive os
pacman -Fyy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak  #copy the required files
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware xorg sddm plasma kde-applications sudo nano git #installing the nessary stuff in /dev/sda where you are going to install arch linux
genfstab -U /mnt >> /mnt/etc/fstab
echo -e "\n\nenter the new user name : " #creating a desktop user
read new_user
echo $new_user > /mnt/etc/hostname
touch /mnt/etc/hosts
echo -e "127.0.0.1 localhost \n::1 localhost\n127.0.1.1 "$new_user >> /mnt/etc/hosts
arch-chroot /mnt useradd -m $new_user
arch-chroot /mnt passwd $new_user
echo -e "\n\nenter the root password"
arch-chroot /mnt passwd #creating root with password
arch-chroot /mnt pacman -Syy grub os-prober
arch-chroot /mnt grub-install $disk #installing grub so that we can enable from boot
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

sed '/root ALL=(ALL) ALL/s/$/ \n'$new_user'ALL=(ALL) ALL\n&/' /mnt/etc/sudoers >> /mnt/etc/sudoers #enabling the nessary things
arch-chroot /mnt systemctl enable sddm
arch-chroot /mnt systemctl enable NetworkManager
sed '/Current=/s/$/ \nbreeze\n&/' /mnt/usr/lib/sddm/sddm.conf.d/default.conf > /mnt/usr/lib/sddm/sddm.conf.d/default.conf
echo -e "\n\nyour os has been installed you can reboot now\nthen boot into the existing os"

#sucess




