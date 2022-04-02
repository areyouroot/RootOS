#!/bin/bash

neofetch
sudo pacman -Syy
sudo pacman -Fyy
sudo pacman -S sudo nano
echo -e "now the visudo will be opened using nano u just need \n to need to add ur user name with the permisions eg add a \n line below like if ur user name is sam \nroot ALL=(ALL:ALL) ALL\nsam ALL=(ALL) ALL\n remember every thing is case sensitive so put all in caps\nread the above 7 lines and type ok to continue"
read verify
EDITOR=nano visudo
pacman -S xorg plasma plasma-wayland-session kde-applications 
systemctl enable sddm.service
systemctl enable NetworkManager.service
pacman -Syu
uname -r
sudo pacman -S linux-lts linux-lts-headers
sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins
sudo pacman -S vlc libreoffice thunderbird firefox gedit flashplugin skype dropbox aria2 p7zip p7zip-plugins unrar tar rsync conky

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