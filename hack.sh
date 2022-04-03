#!/bin/bash

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

