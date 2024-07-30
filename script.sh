git config --global init.defaultBranch main
cd /tmp && git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/fsh

yay -S unzip ttf-font-awesome tmux dbvis jdk11-openjdk neovim flameshot ntfs-3g zoxide clang cmake mechvibes pkg-config ninja p7zip debtap tree xz fzf docker sqlfluff scrcpy neovim copyq ripgrep rp docker-compose github-cli gnome-disk-utility ruby tk thunar rofi noto-fonts-emoji nodejs npm arandr xclip inkscape discord sqlc vlc openssh keychain air-bin picom-bin
yay -S unzip tmux clang cmake ninja p7zip tree xz fzf neovim-nighly python nodejs npm curl vim wget openssh keychain zoxide ripgrep rp sqlfluff

git config --global --add --bool push.autoSetupRemote true
git config --global user.email "eliogaldino79@outlook.com"
git config --global user.name "Elio Galdino"
git config --global init.defaultBranch main
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.cm '!git add -A && git commit -m'
sudo npm install -g typescript typescript-language-server sql-language-server http-server yarn
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://bun.sh/install | bash

sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

rm ~/.zshrc;rm ~/.zsh_history
mkdir /home/elio/Imagens
cp /home/elio/.development/config/wallpaper.jpg /home/elio/Imagens/
ln -sf /home/elio/.development/config/alacritty /home/elio/.config/alacritty
ln -sf /home/elio/.development/config/awesome /home/elio/.config/awesome
ln -sf /home/elio/.development/config/copyq /home/elio/.config/copyq
ln -sf /home/elio/.development/config/tmux /home/elio/.config/tmux
ln -sf /home/elio/.development/config/chromium-flags.conf /home/elio/.config/chromium-flags.conf
ln -sf /home/elio/.development/config/.zshrc /home/elio/.zshrc
ln -sf /home/elio/.development/config/.zsh_history /home/elio/.zsh_history
ln -sf /home/elio/.development/config/.profile /home/elio/.profile

source ~/.zshrc
rustup default nightly && rustup update
cargo install tree-sitter-cli exa zoxide
rustup component add rust-analyzer

flutterLINK="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.22.1-stable.tar.xz"
wget $flutterLINK -O flutter.tar; mv ~/Downloads/command* ./android.zip

unzip android.zip; tar -xf flutter.tar
rm flutter.tar; rm android.zip
./android-studio/bin/studio.sh
cd /tmp/ && git clone https://github.com/biomejs/biome.git && cd biome && cargo build --release && mv ./target/release/biome ~/.development/bins/
#mkdir $HOME/android/cmdline-tools/tools -p; mv ./cmdline-tools/bin $HOME/android/cmdline-tools/tools; mv ./cmdline-tools/lib $HOME/android/cmdline-tools/tools; mv ./cmdline-tools/NOTICE.txt $HOME/android/cmdline-tools/tools;mv ./cmdline-tools/source.properties $HOME/android/cmdline-tools/tools; rm -rf ./cmdline-tools

sdkmanager --install "platform-tools" "emulator" "cmdline-tools;latest" "build-tools;34.0.0" "platforms;android-34"

sudo nmcli -g name,type connection  show  --active | awk -F: '/ethernet|wireless/ { print $1 }' | while read connection
do
  sudo nmcli con mod "$connection" ipv6.ignore-auto-dns yes
  sudo nmcli con mod "$connection" ipv4.ignore-auto-dns yes
  sudo nmcli con mod "$connection" ipv4.addresses "192.168.0.3/24" ipv4.gateway 192.168.0.1
  sudo nmcli con mod "$connection" ipv4.dns "1.1.1.1 1.0.0.1"
  sudo nmcli con down "$connection" && sudo nmcli con up "$connection"
done
sudo localectl set-x11-keymap us "" altgr-intl
sudo setxkbmap -layout us -variant altgr-intl -option nodeadkeys
sudo setxkbmap -layout us -variant intl
sudo vim /etc/systemd/system/getty.target.wants/getty@tty1.service
#ExecStart=-/sbin/agetty -a elio %I 38400




sudo systemctl daemon-reload
sudo systemctl start getty@tty1.service
systemctl --user enable pulseaudio
sudo systemctl enable bluetooth
