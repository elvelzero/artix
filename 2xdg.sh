#!/bin/bash

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
cp -r my/downloads/clone/config/.config/{bash,i3lock-color,kitty,npm,picom,rofi,vim,wgetrc,X11,,xmobar,xmonad,zathura} .config/
sudo cp my/downloads/clone/config/etc/profile.d/* /etc/profile.d/
sudo cp my/downloads/clone/config/etc/bash/bashrc.d/second.bashrc /etc/bash/bashrc.d/
echo "=====:=====:===== Pls Relog :) =====:=====:====="
