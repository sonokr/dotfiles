HISTFILE=$HOME/.zsh_hist
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_no_store
setopt share_history
setopt autocd
setopt auto_list
setopt auto_menu
setopt extendedglob
setopt noflowcontrol
setopt correct
unsetopt beep

bindkey -e

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^O' edit-command-line
