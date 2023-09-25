if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
  eval $(ssh-agent)
        #xset r rate 220 75
fi

export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=pt_BR.UTF-8
export LANG=pt_BR.UTF-8

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh


# bun completions
[ -s "/home/elio/.bun/_bun" ] && source "/home/elio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
