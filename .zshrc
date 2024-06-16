export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/fsh/fast-syntax-highlighting.plugin.zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

[ -s "/home/elio/.bun/_bun" ] && source "/home/elio/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/elio/.development/google-cloud-sdk/path.zsh.inc' ]; then . '/home/elio/.development/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/elio/.development/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/elio/.development/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(zoxide init zsh)"
eval $(keychain --eval /home/elio/.ssh/id_ed25519 --quiet)
. "$HOME/.cargo/env"
