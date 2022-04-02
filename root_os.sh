#!/bin/bash

neofetch
sudo pacman -Syy
sudo pacman -Fyy
sudo pacman -S sudo nano
echo -e "now the visudo will be opened using nano u just need \n to need to add ur user name with the permisions eg add a \n line below like if ur user name is sam \nroot ALL=(ALL:ALL) ALL\nsam ALL=(ALL) ALL\n remember every thing is case sensitive so put all in caps\ntype ok to continue"
EDITOR=nano visudo
pacman -S xorg plasma plasma-wayland-session kde-applications 
systemctl enable sddm.service
systemctl enable NetworkManager.service
