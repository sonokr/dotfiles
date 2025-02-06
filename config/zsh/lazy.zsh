setopt prompt_subst

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
  --color=bg:#161821,bg+:#1b1e2b,fg:#c6c8d1,fg+:#c6c8d1 \
  --color=spinner:#84a0c6,hl:#84a0c6,hl+:#84a0c6 \
  --color=info:#84a0c6,header:#8ca68c,pointer:#84a0c6 \
  --color=marker:#84a0c6,prompt:#84a0c6 \
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

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ryotakusunoki/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="$PATH:/Users/ryotakusunoki/.spicetify"

zsh-defer cache_eval "zoxide init zsh --cmd d"
