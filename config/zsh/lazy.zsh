setopt prompt_subst
NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{13} %F{0}%~%f %k${NEWLINE}%F{4}( '_') < %f"

alias ...='cd ../..'
alias ....='cd ../../..'
alias vim=nvim
alias ls=lsd
alias grep=rg
alias find=fd
alias cat=bat
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt share_history
zstyle ':completion:*:default' menu select=1
export LANG=ja_JP.UTF-8
bindkey -e
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

function cache_eval {
  mkdir -p $HOME/.cache/zsh
  local cache="$HOME/.cache/zsh/$(echo $1 | tr ' ' '_').zsh"
  if [[ ! -s "$cache" ]]; then
    eval $1 > $cache
  fi
  source "$cache"
}

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--multi"

export ZSH_AUTOSUGGEST_USE_ASYNC=1

# user bin
export PATH=$PATH:$HOME/bin

# homebrew
if [ "$(uname -m)" = "arm64" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
else
    eval $(/usr/local/bin/brew shellenv)
fi

# go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# npm
export PATH="~/.npm_global/bin:$PATH"

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/plugins/java/set-java-home.zsh"

# tcl-tk
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"
export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"

# git
git config --global user.name "KUSUNKOI Ryota"
git config --global user.email "ryotakusunoki@hotmail.com"

function cd_ghq_list() {
  local destination_dir="~/git-src/$(ghq list | fzf)"
  if [ -n "$destination_dir" ]; then
    BUFFER="cd $destination_dir"
    zle accept-line
  fi
  zle clear-screen
}
zle -N cd_ghq_list
bindkey '^]' cd_ghq_list


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ryotakusunoki/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export PATH="$PATH:/Users/ryotakusunoki/.spicetify"

zsh-defer cache_eval "zoxide init zsh --cmd d"
