#!/bin/bash

# Core package
cd my/downloads/clone/
git clone https://aur.archlinux.org/aura-bin.git
git clone https://aur.archlinux.org/vim-git.git
cd aura-bin
makepkg -si

cd

sudo pacman -S --needed polkit lxsession xorg-{server,xinit,xrandr,xbacklight,xprop,xsetroot,mkfontdir} xclip xf86-{input-libinput,video-intel} nvidia{,-utils} adobe-source-code-pro-fonts ttf-{cascadia-code,fira-code,jetbrains-mono} && sudo aura -Ax ttf-mononoki && sudo aura -Ax nerd-fonts-mononoki && sudo pacman -S --needed ttf-{baekmuk,hanazono} otf-ipafont adobe-source-han-{sans-{kr,jp},serif-{kr,jp}}-fonts && sudo pacman -S --needed rsync lsof cmake go lua mono npm ruby rust jre{8,11,}-openjdk{,-headless} jdk{8,11,}-openjdk

sudo fc-cache -fv

cd my/downloads/clone/vim-git/
sed -i '46s/disable/enable/' PKGBUILD
sudo pacman -Rns vim
makepkg -si

cd

sudo pacman -S --needed xmonad{,-contrib} xmobar python-pillow kitty{,-terminfo} && sudo aura -Ax google-chrome && sudo aura -Ax spacefm && sudo pacman -S --needed nitrogen picom dmenu rofi scrot && sudo aura -Ax i3lock-color && sudo pacman -S --needed lxappearance qt5ct arc-gtk-theme kvantum-qt5 papirus-icon-theme imagemagick sxiv mpv mpd ncmpcpp ffmpeg tar unzip zip && sudo aura -Ax rar && sudo pacman -S --needed file-roller udisks2 udevil ntfs-3g gvfs libmtp mtpfs gvfs-mtp && sudo aura -Ax jmtpfs && sudo pacman -S --needed libreoffice-fresh gimp inkscape obs-studio && sudo aura -Ax olive && sudo pacman -S --needed zathura{,-cb,-djvu,-pdf-mupdf,-ps}

sudo pacman -S virtualbox
sudo modprobe vboxdrv
sudo usermod -aG vboxusers ur_username
sudo pacman -S virtualbox-guest-{iso,utils}

sudo aura -Ax visual-studio-code-bin
sudo aura -Ax intellij-idea-ce
sudo aura -Ax android-studio

echo "Next task: install sdk, gradle, java, kotlin"
