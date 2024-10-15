#!/bin/bash

# set settings related to locale
sed -i -e 's|#pt_BR.UTF-8 UTF-8|pt_BR.UTF-8 UTF-8|' /etc/locale.gen 
locale-gen
echo "LANG=pt_BR.UTF-8" >/etc/locale.conf

# set the time zone
ln -sf /usr/share/zoneinfo/America/Maceio /etc/localtime 
hwclock --systohc

# set hostname
echo "ArchElio" >/etc/hostname

# configure hosts file
echo '127.0.0.1      localhost' >> /etc/hosts
echo '::1      localhost' >> /etc/hosts
echo '127.0.1.1      ArchElio.localdomain' >> /etc/hosts

sed -i -e '/^#GRUB_DISABLE_OS_PROBER=false/s/^#//' /etc/default/grub

# set root user password
passwd
useradd -G wheel,power,storage -m -s /usr/bin/zsh elio
passwd elio

sed -i -e '/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/s/^# //' /etc/sudoers

# install and configure grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# enable NetworkManager systemd service
systemctl enable NetworkManager
