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

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/$UID

defaults write org.hammerspoon.Hammerspoon MJConfigFile "$XDG_CONFIG_HOME"/hammerspoon/init.lua