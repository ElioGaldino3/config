cd /tmp && git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si
cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://git.io/zinit-install)"

ya unzip archlinux-keyring google-chrome neovim flameshot gnome-disk-utility ntfs-3g clang cmake pkg-config ninja p7zip gtk3 debtap tree xz fzf docker scrcpy neovim picom-git copyq docker-compose github-cli gnome-disk-utility ruby tk

git config --global user.email "eliogaldino79@outlook.com"
git config --global user.name "Elio Galdino"

sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

mkdir ~/.fonts; cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip; unzip JetBrainsMono.zip
rm LICENSE OFL.txt readme.md FiraCode.zip JetBrainsMono.zip

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default nightly && rustup update
cargo install tree-sitter-cli exa

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
ln -sf /home/elio/.development/config/alacritty /home/elio/.config/alacritty
ln -sf /home/elio/.development/config/awesome /home/elio/.config/awesome
ln -sf /home/elio/.development/config/copyq /home/elio/.config/copyq
ln -sf /home/elio/.development/config/nvim /home/elio/.config/nvim
ln -sf /home/elio/.development/config/tmux /home/elio/.config/tmux
