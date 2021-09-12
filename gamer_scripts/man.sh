#!/bin/bash

#common

#change dns
echo -e "run as root\nrun this script after installing the arch linux \n\ntype 'yes' and enter to continue else ctrl+c"
read ans
sudo touch a
sudo echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n[core]\nInclude = /etc/pacman.d/mirrorlist\n[extra]\nInclude = /etc/pacman.d/mirrorlist\n[community]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf
sudo echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolv.conf
sudo pacman -Fyy
sudo pacman -Syyu
sudo pacman -Syy dhcpcd bluez bluez-utils cups xf86-video-intel xf86-video-amdgpu nvidia fish nvidia-utils firefox nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader dpkg
sudo systemctl enable bluetooth
sudo echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/fish
sudo systemctl enable org.cups.cupsd
rm -r a
#man enabling games

echo "lets begin the real game"

sudo pacman -Syy steam wine lutris

#common
echo -e "now the systerm is going to reboot \n\ntype 'yes' and enter to continue else ctrl+c"
read ans 

reboot