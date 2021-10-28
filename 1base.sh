#!/bin/bash
#
## My Artix Linux Install Script
#
# Swapfile
dd if=/dev/zero of=/swap/swapfile bs=1G count=2 status=progress
chmod 600 /swap/swapfile
mkswap /swap/swapfile
swapon /swap/swapfile
echo "" >> /etc/fstab
echo "# /swap/swapfile" >> /etc/fstab
echo "/swap/swapfile    none    swap    defaults    0 0" >> /etc/fstab

# Swappiness
mkdir /etc/sysctl.d
touch /etc/sysctl.d/99-swappiness.conf
echo "vm.swappiness=10" >> /etc/sysctl.d/99-swappiness.conf

# Timezone
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc

# Locale
sed -i '177s/.//' /etc/locale.gen # en_US: change line 177 first char with nothing :)
sed -i '289s/.//' /etc/locale.gen # id_ID
sed -i '302s/.//' /etc/locale.gen # ja_JP
sed -i '313s/.//' /etc/locale.gen # ko_KR
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Hostname & hosts : Change the host name to what u want
echo "urHostName" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 urHostName.localdomain  urHostName" >> /etc/hosts

# Artix Arch Linux Support
pacman -S artix-archlinux-support pacman-contrib
pacman-key --populate archlinux

echo "" >> /etc/pacman.conf
echo "# ARCH LINUX" >> /etc/pacman.conf
echo "# [core]" >> /etc/pacman.conf
echo "# Include = /etc/pacman.d/mirrorlist-arch"

echo "" >> /etc/pacman.conf
echo "[extra]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch"

echo "" >> /etc/pacman.conf
echo "[community]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch"

echo "" >> /etc/pacman.conf
echo "# [multilib]" >> /etc/pacman.conf
echo "# Include = /etc/pacman.d/mirrorlist-arch"

echo "" >> /etc/pacman.conf
echo "# UNIVERSE" >> /etc/pacman.conf
echo "Server = https://universe.artixlinux.org/$arch"

# Base packages
pacman -Syu --needed grub efibootmgr networkmanager{,-runit} ufw{,-runit} alsa-utils pulseaudio{,-alsa} bash-completion xdg-{utils,user-dirs} bat htop lsd neofetch

# Installing grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# xdg user dirs
sed -i 's/Desktop/desktop/' /etc/xdg/user-dirs.defaults
sed -i 's/Downloads/my\/downloads/' /etc/xdg/user-dirs.defaults
sed -i 's/Templates/my\/templates/' /etc/xdg/user-dirs.defaults
sed -i 's/Public/my\/public/' /etc/xdg/user-dirs.defaults
sed -i 's/Documents/my\/documents/' /etc/xdg/user-dirs.defaults
sed -i 's/Music/my\/music/' /etc/xdg/user-dirs.defaults
sed -i 's/Pictures/my\/pictures/' /etc/xdg/user-dirs.defaults
sed -i 's/Videos/my\/videos/' /etc/xdg/user-dirs.defaults

echo "=====:=====:===== Things Left =====:=====:====="
echo "Change root passwd: passwd"
echo "Add a user        : useradd -mG wheel ur_username"
echo "Edit visudo       : EDITOR=vim visudo"
echo "                    exit umount & reboot. DONE :)"
