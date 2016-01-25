#!/bin/bash

# install all programs for i3 on a new machine
echo "Remeber to git clone ubuntu-dotfiles before installing everything"
read

# install i3
apt-get install i3
# install playerctl from a .deb release if you need multimedia keys to work on a laptop
# download to temp
cd /tmp/ && wget https://github.com/acrisci/playerctl/releases/download/v0.4.2/playerctl-0.4.2_amd64.deb

# install deb package
dpkg -i /tmp/playerctl*

# modify monitors resolution
# to save for i3, save the setting and copy the content from the generated bash file
# cat ~/.screenlayout/foo.so
apt-get install arandr

# file manager
apt-get install ranger -y

# install San Francisco font system wide
cd /tmp/ && wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
# unzip
unzip /tmp/master.zip
# move to system fonts
mv /tmp/Yo*/*.ttf ~/.fonts

# install fontawsome
cd /tmp/ && wget https://github.com/FortAwesome/Font-Awesome/archive/v4.5.0.zip
unzip /tmp/v4*.zip
mv /tmp/Font-A*/fonts/*.ttf ~/.fonts

# change gtk-theme font for system
apt-get install lxappearance -y
echo "Remeber to open, lxappearance and set SFNS Display font for gtk"
echo "Press enter to continue"

# install infinality for better font rendering
add-apt-repository ppa:no1wantdthisname/ppa
apt-get update
apt-get upgrade -y
apt-get install fontconfig-infinality -y

# set osx display style
bash /etc/fonts/infinality/infctl.sh setstyle osx

# install gtk-2, 3 visual theme
sudo add-apt-repository ppa:noobslab/themes && sudo apt-get update && sudo apt-get install polar-night-gtk -y --force-yes

# install rofi app launcher
cd /tmp/ && wget https://launchpad.net/ubuntu/+source/rofi/0.15.11-1/+build/8289001/+files/rofi_0.15.11-1_amd64.deb /tmp/
dpkg -i /tmp/rofi*.deb

# to fix i3 opacity
apt-get install compton -y

# install i3blocks
git clone git://github.com/vivien/i3blocks /tmp/i3blocks
apt-get install ruby-ronn -y
cd /tmp/i3blocks  && make clean all
make install

echo "Install completed. Remember to copy the config files from ubuntu-dotfiles"
