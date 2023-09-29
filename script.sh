cd /tmp && git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/path/to/fsh

yay -S unzip jre17-openjdk neovim flameshot gnome-disk-utility ntfs-3g clang cmake pkg-config ninja p7zip debtap tree xz fzf docker scrcpy neovim copyq docker-compose github-cli gnome-disk-utility ruby tk
yay -S unzip neovim jre17-openjdk clang cmake pkg-config ninja p7zip debtap tree xz fzf neovim ruby

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

rm ~/.zshrc;rm ~/.zsh_history

ln -sf /home/elio/.development/config/.zshrc /home/elio/.zshrc
ln -sf /home/elio/.development/config/.zsh_history /home/elio/.zsh_history
ln -sf /home/elio/.development/config/.profile /home/elio/.profile

export flutterLINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.5-stable.tar.xz"
export androidLINK="https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip"

wget $flutterLINK -O flutter.tar; wget $androidLINK -O android.zip
unzip android.zip; tar -xf flutter.tar
rm flutter.tar; rm android.zip
mkdir $HOME/android/cmdline-tools/tools -p; mv ./cmdline-tools/bin $HOME/android/cmdline-tools/tools; mv ./cmdline-tools/lib $HOME/android/cmdline-tools/tools; mv ./cmdline-tools/NOTICE.txt $HOME/android/cmdline-tools/tools;mv ./cmdline-tools/source.properties $HOME/android/cmdline-tools/tools

sudo nmcli connection modify "Conexão cabeada 1" ipv4.dns "8.8.8.8,8.8.4.4"
sudo nmcli connection modify "Conexão cabeada 1" ipv6.dns "2001:4860:4860::8888,2001:4860:4860::8844"
sudo nmcli connection down "Conexão cabeada 1"
sudo nmcli connection up "Conexão cabeada 1"

localectl set-x11-keymap us "" altgr-intl
setxkbmap -layout us -variant altgr-intl -option nodeadkeys
