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
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/fsh/fast-syntax-highlighting.plugin.zsh


# bun completions
[ -s "/home/elio/.bun/_bun" ] && source "/home/elio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/elio/.development/google-cloud-sdk/path.zsh.inc' ]; then . '/home/elio/.development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/elio/.development/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/elio/.development/google-cloud-sdk/completion.zsh.inc'; fi
