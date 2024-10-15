#!/bin/bash
timedatectl set-timezone America/Maceio
export BLOCK_DEVICE=/dev/...
fdisk "${BLOCK_DEVICE}" <<EOF
g
n
1

+550M
t
1
n
2


w
EOF

pacstrap -i /mnt base base-devel linux linux-firmware linux-headers intel-ucode vim util-linux os-prober git unzip networkmanager sudo neofetch dhcpcd wget curl ripgrep fd lazygit fd clang cmake ruby go pulseaudio gnome-disk-utility chromium zsh rsync xorg-server xorg-xinit alacritty awesome ntfs-3g vlc ffmpeg android-file-transfer pacman-contrib grub efibootmgr dosfstools pavucontrol
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt ./install2.sh
echo "exec awesome" > /mnt/home/elio/.xinitrc
umount -lR /mnt
