export PATH="$PATH:$HOME/.development/flutter/bin"
export PATH="$PATH:$HOME/.development/bins"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export JAVA_HOME="/usr/lib/jvm/default/"
export ANDROID_HOME2=$HOME/android
export PATH=$ANDROID_HOME2/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME2/emulator/:$PATH
export PATH=$ANDROID_HOME2/platform-tools/:$PATH
export PATH="/home/elio/Projetos/Games/shapez-community-edition/build_output/standalone/shapez-linux-x64:$PATH" export CHROME_EXECUTABLE="$(which chromium)"

. "$HOME/.cargo/env"

alias ll="exa -l -g --icons"
alias lla="ll -a"

alias fucl="flutter clean && flutter pub get && rm **/*.g.dart"
alias mobu="flutter pub run build_runner build --delete-conflicting-outputs"
alias mowa="flutter pub run build_runner watch --delete-conflicting-outputs"
alias mocl="fucl && mowa"
alias fubu="fucl && mobu && flutter build apk --release"
alias proj="cc $HOME/Projetos"
alias est="cc $HOME/Projetos/Estudos"
alias estts="cc $HOME/Projetos/Estudos/Typescript"
alias estdart="cc $HOME/Projetos/Estudos/Dart"
alias estflutter="cc $HOME/Projetos/Estudos/Flutter"
alias estelixir="cc $HOME/Projetos/Estudos/Elixir"
alias esthtml="cc $HOME/Projetos/Estudos/HTML"
alias gitclean="git branch --list | egrep --invert-match '(master|dev|\*)'| xargs git branch -D"
alias debi="sudo dpkg -i ~/Downloads/**/*.deb && sudo rm ~/Downloads/**/*.deb"
alias g="git"
alias cleanlibs="find . -name 'node_modules' -type d -prune -print | xargs du -chs && find . -name '.dart_tool' -type d -prune -print | xargs du -chs"
alias py="python"
alias trab="proj; cd gg_food/app_customer; tmux"
alias trabb="proj; cd gg_food/backend_go;tmux"
alias eleve-dev="sudo http-server $HOME/Projetos/Eleve/dev_flutter/build/web -p 80 -c-1"
alias vi="nvim"
alias vim="nvim"
alias ya="yay -S"
alias cvi="vi ~/.config/nvim"
alias czsh="vi ~/.zshrc"
alias cpro="vi ~/.profile"
alias luasnip="/home/elio/Projetos/luasnip_generator/build/linux/x64/release/bundle/luasnip_generator"
alias emu="emulator -avd flutter2 -gpu host -accel on -nocache -no-snapstorage -no-snapshot -noskin -noaudio"
alias dmods="cd $HOME/.local/share/Steam/steamapps/common/Don\'t\ Starve\ Together/mods"
alias dst="cd /home/elio/.steam/steam/steamapps/common/Don\'t\ Starve\ Together/mods"

function cc {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    cd $1
  else
    mkdir $1 -p && cd $1
  fi
}

function c3d {
  cd /home/elio/Projetos/3D/GCODES
  sudo mount /dev/$1 /mnt/3D_SD
  py corrigir.py 
  sudo rm /mnt/3D_SD/*.gcode --force
  sudo cp ./*.gcode /mnt/3D_SD
  rm *.gcode
  sudo umount /dev/$1
}

function recCel {
  if [ -f "$HOME/Video/file.mp4"] ; then
    rm "$HOME/Videos/file.mp4"
  fi

  scrcpy -Nr ~/Videos/file.mp4 --show-touches -m 720
}
export PATH="$PATH":"$HOME/.pub-cache/bin"
#alias python="$(pyenv which python)"
#alias pip="$(pyenv which pip)"
