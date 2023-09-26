export PATH="$PATH:$HOME/.development/flutter/bin"
export PATH="$PATH:$HOME/.local/bin"
export ANDROID_HOME=$HOME/android
export JAVA_HOME="/usr/lib/jvm/default/"
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

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
#alias trab="proj; cd eliana; cd app;code .; cd ../backend; yarn start:prod"
alias trab="proj; cd Eleve"
alias eleve-dev="sudo http-server $HOME/Projetos/Eleve/dev_flutter/build/web -p 80 -c-1"
alias vi="nvim"
alias vim="nvim"
alias ya="yay -S"
alias cvi="vi ~/.config/nvim"
alias czsh="vi ~/.zshrc"
alias cpro="vi ~/.profile"
alias luasnip="/home/elio/Projetos/luasnip_generator/build/linux/x64/release/bundle/luasnip_generator"

function cc {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    cd $1
  else
    mkdir $1 -p && cd $1
  fi
}

function recCel {
  if [ -f "$HOME/Video/file.mp4"] ; then
    rm "$HOME/Videos/file.mp4"
  fi

  scrcpy -Nr ~/Videos/file.mp4 --show-touches -m 720
}
