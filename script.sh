cd /tmp && git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si
cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://git.io/zinit-install)"

ya unzip archlinux-keyring google-chrome neovim flameshot gnome-disk-utility ntfs-3g clang cmake pkg-config ninja p7zip gtk3 debtap tree xz fzf docker docker-compose github-cli gnome-disk-utility ruby tk

git config --global user.email "eliogaldino79@outlook.com"
git config --global user.name "Elio Galdino"

sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

mkdir ~/.fonts; cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip; unzip JetBrainsMono.zip
rm LICENSE OFL.txt readme.md

