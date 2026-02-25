if [[ -n $BASH_VERSION ]]; then
  for _bc in /opt/homebrew/etc/bash_completion /usr/local/etc/bash_completion; do
    [[ -s "$_bc" ]] && source "$_bc" && break
  done
  unset _bc
fi

[[ -n $BASH_VERSION ]] && command -v fzf >/dev/null && eval "$(fzf --bash)"
command -v fzf >/dev/null && command -v fd >/dev/null && \
  export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git" && \
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" && \
  export FZF_ALT_C_COMMAND='fd --type d --color=always --follow --hidden --exclude .git' && \
  export FZF_DEFAULT_OPTS="--ansi"
command -v fzf >/dev/null && command -v bat >/dev/null && \
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview-window 'right:70%' --preview 'bat --color=always --theme=\"Catppuccin Mocha\" {}'"

[[ -d "$HOME/.nvm" ]] && export NVM_DIR="$HOME/.nvm" && [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]] && source "/opt/homebrew/opt/nvm/nvm.sh"

if [ -d "$HOME/.pyenv" ]; then
  if [ $(uname) = "Linux" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
  fi
  command -v pyenv > /dev/null && eval "$(pyenv init -)"
fi

if [[ -d "/opt/homebrew/opt/go" ]]; then
  export GOROOT=/opt/homebrew/opt/go/libexec
elif [[ -d "/usr/local/opt/go" ]]; then
  export GOROOT=/usr/local/opt/go/libexec
elif [[ -d "/usr/local/go" ]]; then
  export GOROOT=/usr/local/go
fi
if [[ -n "$GOROOT" ]]; then
  [ ! -d "$HOME/go" ] && mkdir "$HOME/go"
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

[[ -d "$HOME/.cargo" ]] && export PATH="$HOME/.cargo/bin:$PATH"

[[ -s /opt/homebrew/share/chruby/chruby.sh ]] && source /opt/homebrew/share/chruby/chruby.sh
command -v chruby > /dev/null && chruby 3.3
