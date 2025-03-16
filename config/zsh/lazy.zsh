alias ...='cd ../..'
alias ....='cd ../../..'
alias vim=nvim
alias ls=lsd
alias grep=rg
alias find=fd
alias cat=bat
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
zstyle ':completion:*:default' menu select=1

EDITOR='nvim'
VISUAL='nvim'

export FZF_DEFAULT_OPTS=" \
  --color=bg:#161821,bg+:#1b1e2b,fg:#c6c8d1,fg+:#c6c8d1 \
  --color=spinner:#84a0c6,hl:#84a0c6,hl+:#84a0c6 \
  --color=info:#84a0c6,header:#8ca68c,pointer:#84a0c6 \
  --color=marker:#84a0c6,prompt:#84a0c6 \
  --multi"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

export PATH=$PATH:$HOME/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH="~/.npm_global/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"
export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
export PATH="/Users/ryotakusunoki/.rd/bin:$PATH"
export PATH="$PATH:/Users/ryotakusunoki/.spicetify"

# git
git config --global user.name "KUSUNKOI Ryota"
git config --global user.email "ryotakusunoki@hotmail.com"

function cdr() {
  if git rev-parse --show-toplevel > /dev/null 2>&1; then
    cd "$(git rev-parse --show-toplevel)"
  else
    echo "Not in a git repository"
  fi
}

function cache_eval {
  mkdir -p $HOME/.cache/zsh
  local cache="$HOME/.cache/zsh/$(echo $1 | tr ' ' '_').zsh"
  if [[ ! -s "$cache" ]]; then
    eval $1 > $cache
  fi
  source "$cache"
}
zsh-defer cache_eval "zoxide init zsh"

# homebrew
if [ "$(uname -m)" = "arm64" ]; then
    zsh-defer cache_eval "/opt/homebrew/bin/brew shellenv"
else
    zsh-defer cache_eval "/usr/local/bin/brew shellenv"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
