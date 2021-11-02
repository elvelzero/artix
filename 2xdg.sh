#!/bin/bash

echo "=====:=====:===== Enabling ufw & NetworkManager =====:=====:====="
sudo ln -s /etc/runit/sv/ufw /run/runit/service/ufw
sudo ln -s /etc/runit/sv/NetworkManager /run/runit/service/NetworkManager

sudo ufw enable
sudo ufw status verbose

echo "=====:=====:===== Make XDG Base Dirs & Move Some Items =====:=====:====="
mkdir -p ~/{.cache/{xmonad,thumbnails/{fail,large,normal,x-large,xx-large}},.config/{android,bash,java,xmonad,xmobar,zsh},.local/{share/xmonad,state/bash}}
mv .bash* .config/bash/
mv .config/bash/.bash_logout .config/bash/bash_logout
mv .config/bash/.bash_profile .config/bash/bash_profile
mv .config/bash/.bashrc .config/bash/bashrc

echo "=====:=====:===== Update XDG User Dirs & Clone My Config =====:=====:====="
xdg-user-dirs-update
mkdir my/downloads/clone
cd my/downloads/clone
git clone https://github.com/iNeobee/config
cd
echo "=====:=====:===== Copying my conig file =====:=====:====="
cp -r my/downloads/clone/config/.config/{bash,i3lock-color,kitty,npm,picom,rofi,vim,wgetrc,X11,,xmobar,xmonad,zathura} .config/
echo "=====:=====:===== Copying things to /etc/{profile.d/,bash/bashrc.d/} =====:=====:====="
sudo cp my/downloads/clone/config/etc/profile.d/* /etc/profile.d/
sudo cp my/downloads/clone/config/etc/bash/bashrc.d/second.bashrc /etc/bash/bashrc.d/

echo "=====:=====:===== Don't Forget to Source bashrc & bash_profile =====:=====:====="
source .config/bash/bashrc
source .config/bash/bash_profile

echo "=====:=====:===== Pls Relog & remove .bash_history file :) =====:=====:====="
