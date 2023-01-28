typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -z "$DISPLAY" ]] then
	startx
        xset r rate 220 65
fi

SSH_AUTH_SOCK=/tmp/ssh-XXXXXX4dBUC7/agent.29518; export SSH_AUTH_SOCK;
SSH_AGENT_PID=29519; export SSH_AGENT_PID;

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export LANG=pt_BR.UTF-8

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

LS_COLORS=$LS_COLORS:'ow=01;34:' ; export $LS_COLORS

export LC_ALL=pt_BR.UTF-8
source $HOME/.profile

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/elio/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/elio/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/elio/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/elio/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

