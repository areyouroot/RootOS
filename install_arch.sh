#!/bin/bash

echo -e "run this script with arch linux iso from https://archlinux.org/ \n or else run this with your own risk \n and the time zone used here is australia south"
echo -e "\n\n before running this script make sure that u have a internet connection\n this script doesnt support swap etc...\n to know more read the script"

ping -c 3 1.1.1.1  #showing the internet connectivity

echo -e "\n loading english keyboard layout"

loadkeys us

timedatectl set-ntp true #Enable Network Time Protocols 
timedatectl status #

#Partition the Disks

clear

fdisk -l 

echo -e "\n \nenter your disk to be selected  "

read disk

clear

echo -e "\n\nnow u need to manually partition your disk \n enter any thing and press enter to continue use dos mode \n instructions for dos mod select dos mod \n select free space the select new type partiton size \n select primary select bootable select write \n then select quit"

read verify

cfdisk $disk #creating a disk partition

clear

mkfs.ext4 $disk"1"

mount $disk"1" /mnt  #mounting the ur disk

pacman -Syy #updating and pacman and installing things temporvary in archlive os
pacman -Fyy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak  #copy the required files
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware #installing the nessary stuff in /dev/sda where you are going to install arch linux
genfstab -U /mnt >> /mnt/etc/fstab
echo -e "\n\nenter the new user name : " #creating a desktop user
read new_user
echo $new_user > /mnt/etc/hostname
touch /mnt/etc/hosts
echo -e "127.0.0.1 localhost \n::1 localhost\n127.0.1.1 "$new_user >> /mnt/etc/hosts
arch-chroot /mnt useradd -m $new_user
arch-chroot /mnt passwd $new_user
arch-chroot /mnt systemctl enable NetworkManager
arch-chroot /mnt echo $new_user > /etc/hostname
echo -e "\n127.0.0.1   localhost\n::1         localhost\n127.0.1.1	$new_user"
arch-chroot /mnt systemctl enable dhcpcd
arch-chroot /mnt timedatectl set-timezone Australia/South
echo -e "\n\nenter the root password"
arch-chroot /mnt passwd #creating root with password
arch-chroot /mnt pacman -Syy grub os-prober
arch-chroot /mnt grub-install $disk #installing grub so that we can enable from boot
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
arch-chroot /mnt pacman -S grub efibootmgr
arch-chroot /mnt mkdir /boot/efi
arch-chroot /mnt mount /dev/sdX1 /boot/efi
arch-chroot /mnt grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

sed '/root ALL=(ALL) ALL/s/$/ \n'$new_user' ALL=(ALL) ALL\n&/' /mnt/etc/sudoers >> /mnt/etc/sudoers #enabling the nessary things

clear

echo -e "\n\nyour os has been installed you can reboot now\nthen boot into the existing os\n now reboot thanks for using this script please support us\n su root"

#sucess




