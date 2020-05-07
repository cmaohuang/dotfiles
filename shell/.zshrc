[ $(uname) = "Darwin" ] && SHARE_DIR=/usr/local/share || SHARE_DIR=/usr/share
fpath=("${SHARE_DIR}/zsh-completions" $fpath)
autoload -Uz compinit promptinit
compinit
promptinit
prompt fade green
autoload -Uz select-word-style
select-word-style bash
autoload -Uz bashcompinit
bashcompinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

source "${SHARE_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${SHARE_DIR}/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
source "${SHARE_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"

setopt auto_cd auto_pushd pushd_ignore_dups
setopt always_to_end

export HISTFILE=~/.zsh_history
export HISTSIZE=3000
export SAVEHIST=3000
setopt extended_history hist_ignore_all_dups hist_ignore_dups hist_ignore_space inc_append_history share_history
setopt interactive_comments
setopt complete_in_word
