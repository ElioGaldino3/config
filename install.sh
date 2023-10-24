#!/bin/bash

# Este é um comentário
# O interpretador Bash usa '#!' (shebang) para determinar qual shell usar

# Variável de exemplo
nome="João"

# Exibe uma mensagem na tela
echo "Olá, $nome! Este é um exemplo de script shell."

# Fim do script

mkfs.vfat -F32 -n EFI /dev/nvme1n1p1
mkfs.btrfs -f -L linuxroot /dev/nvme1n1p2
mount /dev/nvme1n1p2 /mount
mkdir /mnt/boot/efi -p
mount /dev/nvme1n1p1 /mnt/boot/efi

btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/srv
btrfs subvolume create /mnt/var
btrfs subvolume create /mnt/var/log
btrfs subvolume create /mnt/var/cache
btrfs subvolume create /mnt/var/tmp

timedatectl set-timezone America/Maceio
mkdir /backup
mount /dev/nvme0n1p1 /backup
cp /backup/mirrorlist /etc/pacman.d/
vim /etc/pacman.conf
pacstrap -i base base-devel linux linux-firmware linux-headers intel-ucode vim btrfs-progs dos-fsutils util-linux git unzip sbctl networkmanager sudo neofetch dhcpcd wget curl ripgrep fd lazygit fd clang cmake ruby go pulseaudio gnome-disk-utility chromium zsh pazucontrol rsync xorg-server xorg-xinit alacritty awesome update-grup ntfs-3g ngork vlc ffmpeg android-file-transfer firebase qbittorent pacman-contrib ab grub efibootmgr dosfstools mtools os-prober
genfstab -U /mnt >> /mnt/etc/fstab
sed -i -e "/^#"pt_BR.UTF-8"/s/^#//" /mnt/etc/locale.gen
systemd-firstboot --root /mnt --prompt
arch-chroot /mnt locale-gen
arch-chroot /mnt passwd
arch-chroot /mnt useradd -G wheel,power,storage -m -s /usr/bin/zsh elio
arch-chroot /mnt passwd elio
sed -i -e '/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/s/^# //' /mnt/etc/sudoers
arch-chroot /mnt echo '127.0.0.1      localhost' >> /etc/hosts
arch-chroot /mnt echo '::1      localhost' >> /etc/hosts
arch-chroot /mnt echo '127.0.1.1      ArchElio.localdomain' >> /etc/hosts
systemctl --root /mnt enable dhcpcd NetworkManager
arch-chroot /mnt
