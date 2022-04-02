#!/bin/bash

neofetch
sudo pacman -Syy
sudo pacman -Fyy
sudo pacman -S sudo nano
echo -e "now the visudo will be opened using nano u just need \n to need to add ur user name with the permisions eg add a \n line below like if ur user name is sam \nroot ALL=(ALL:ALL) ALL\nsam ALL=(ALL) ALL\n remember every thing is case sensitive so put all in caps\ntype ok to continue"
read verify
EDITOR=nano visudo
pacman -S xorg plasma plasma-wayland-session kde-applications 
systemctl enable sddm.service
systemctl enable NetworkManager.service
pacman -Syu
uname -r
sudo pacman -S linux-lts linux-lts-headers yaourt yay
sudo pacman -Rs linux
yaourt -S pamac-aur
sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins
sudo pacman -S vlc libreoffice thunderbird firefox gedit flashplugin skype dropbox aria2 p7zip p7zip-plugins unrar tar rsync conky

