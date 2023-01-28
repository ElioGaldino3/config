cd /tmp && git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si
cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://git.io/zinit-install)"

ya archlinux-keyring google-chrome neovim flameshot gnome-disk-utility ntfs-3g clang cmake pkg-config ninja p7zip gtk3 debtap tree xz fzf docker docker-compose github-cli gnome-disk-utility ruby tk

git config --global user.email "eliogaldino79@outlook.com"
git config --global user.name "Elio Galdino"

sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
