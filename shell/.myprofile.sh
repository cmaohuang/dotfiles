[[ -s /usr/local/etc/bash_completion && -n $BASH_VERSION ]] && source /usr/local/etc/bash_completion

[[ -n $ZSH_VERSION ]] && source <(fzf --zsh)
[[ -n $BASH_VERSION ]] && eval "$(fzf --bash)"
command -v fzf fd > /dev/null && \
  export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git" && \
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND && \
  export FZF_ALT_C_COMMAND='fd --type d --color=always --follow --hidden --exclude .git' && \
  export FZF_DEFAULT_OPTS="--ansi"
command -v fzf bat > /dev/null && \
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview-window 'right:70%' --preview 'bat --color=always --theme=\"Catppuccin Mocha\" {}'"

[[ -s /opt/homebrew/share/chruby/chruby.sh ]] && source /opt/homebrew/share/chruby/chruby.sh
command -v chruby > /dev/null && chruby 3.3

if [[ -d "/usr/local/go" || -d "/usr/local/opt/go" ]]; then
  [ $(uname) = "Darwin" ] && export GOROOT=/usr/local/opt/go/libexec || export GOROOT=/usr/local/go
  [ ! -d "$HOME/go" ] && mkdir "$HOME/go"
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

[[ -d "$HOME/.nvm" ]] && export NVM_DIR="$HOME/.nvm" && [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && source "/opt/homebrew/opt/nvm/nvm.sh"

[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

if [ -d "$HOME/.pyenv" ]; then
  if [ $(uname) = "Linux" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
  fi
  command -v pyenv > /dev/null && eval "$(pyenv init -)"
fi

[[ -d "$HOME/.cargo" ]] && export PATH="$HOME/.cargo/bin:$PATH"

[[ -s ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

[[ -d "$HOME/.krew/bin" ]] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
