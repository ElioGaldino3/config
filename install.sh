#!/bin/bash
timedatectl set-timezone America/Maceio

pacstrap -i /mnt base base-devel linux linux-firmware linux-headers intel-ucode vim util-linux os-prober git unzip networkmanager sudo neofetch dhcpcd wget curl ripgrep fd lazygit fd clang cmake ruby go pulseaudio gnome-disk-utility chromium zsh rsync xorg-server xorg-xinit alacritty awesome ntfs-3g vlc ffmpeg android-file-transfer pacman-contrib grub efibootmgr dosfstools pavucontrol
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
sed -i -e '/^#GRUB_DISABLE_OS_PROBER=false/s/^#//' /etc/default/grub
arch-chroot /mnt grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
systemctl --root /mnt enable dhcpcd NetworkManager
echo "exec awesome" > /mnt/home/elio/.xinitrc
umount -lR /mnt
