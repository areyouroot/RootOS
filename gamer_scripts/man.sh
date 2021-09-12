#!/bin/bash

#common

#change dns
echo -e "run this script after installing the ach linux \n\ntype 'yes' and enter to continue else ctrl+c"
read ans
sudo echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolv.conf
sudo pacman -Fyy
sudo pacman -Syyu
sudo pacman -Syy dhcpcd bluez bluez-utils cups xf86-video-intel xf86-video-amdgpu nvidia nvidia-utils virtualbox-host-dkms virtualbox-host-modules-arch firefox brave nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
sudo systemctl enable bluetooth
sudo systemctl enable org.cups.cupsd

#man enabling games

echo "lets begin the real game"

sudo pacman -Syy steam wine lutris

#common

reboot