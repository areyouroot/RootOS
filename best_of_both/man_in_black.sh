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
sudo pacman -Syy dhcpcd bluez bluez-utils cups xf86-video-intel xf86-video-amdgpu nvidia fish nvidia-utils virtualbox-host-dkms virtualbox-host-modules-arch firefox brave nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
sudo systemctl enable bluetooth
sudo echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/fish
sudo systemctl enable org.cups.cupsd
rm -r a
#man enabling games

echo "lets begin the real game"

sudo pacman -Syy steam wine lutris

#getting black

echo "lets hack the world"
# Run https://blackarch.org/strap.sh as root and follow the instructions.

curl -O https://blackarch.org/strap.sh
# Verify the SHA1 sum

echo 46f035c31d758c077cce8f16cf9381e8def937bb strap.sh | sha1sum -c
# Set execute bit

chmod +x strap.sh
# Run strap.sh

sudo ./strap.sh
# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:

sudo pacman -Syyu

# To list all of the available tools, run

sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u
# To install all of the tools, run

sudo pacman -S blackarch
# To install a category of 

# Note - it maybe be necessary to overwrite certain packages when installing blackarch tools. If
# you experience "failed to commit transaction" errors, use the --needed and --overwrite switches
# For example:

sudo pacman -Syyu --needed blackarch --overwrite='*'

# Run and follow the instructions

sudo blackarch-install

#common
echo -e "now the systerm is going to reboot \n\ntype 'yes' and enter to continue else ctrl+c"
read ans 

reboot