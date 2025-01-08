[[ -f ~/.zsh-plugins/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/zsh-snap
source ~/.zsh-plugins/zsh-snap/znap.zsh

autoload -Uz compinit promptinit
compinit
promptinit
#prompt fade green
autoload -Uz select-word-style
select-word-style bash
autoload -Uz bashcompinit
bashcompinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
znap source zsh-users/zsh-autosuggestions
znap source ael-code/zsh-colored-man-pages

setopt auto_cd auto_pushd pushd_ignore_dups
setopt always_to_end

export HISTFILE=~/.zsh_history
export HISTSIZE=3000
export SAVEHIST=3000
setopt extended_history hist_ignore_all_dups hist_ignore_dups hist_ignore_space inc_append_history share_history
setopt interactive_comments
setopt complete_in_word

command -v zoxide > /dev/null && eval "$(zoxide init zsh)"
command -v starship > /dev/null && eval "$(starship init zsh)"

