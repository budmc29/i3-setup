#!/bin/bash

# install all programs for i3 on a new machine
echo "Remeber to git clone ubuntu-dotfiles before installing everything"
read

# install playerctl from a .deb release if you need multimedia keys to work on a laptop

# download to temp
cd /tmp/ && wget https://github.com/acrisci/playerctl/releases/download/v0.4.2/playerctl-0.4.2_amd64.deb

# install deb package
dpkg -i /tmp/playerctl*

