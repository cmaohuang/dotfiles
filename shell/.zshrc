for file in ~/.{aliases,functions}; do
    [[ -s "$file" ]] && source "$file"
done

# --- znap bootstrap ---
[[ -f ~/.zsh-plugins/zsh-snap/znap.zsh ]] ||
  git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/zsh-snap
source ~/.zsh-plugins/zsh-snap/znap.zsh

# --- plugins (先載入) ---
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-autosuggestions
znap source ael-code/zsh-colored-man-pages

# --- completion system ---
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# --- word movement style ---
autoload -Uz select-word-style
select-word-style bash

# --- keybindings ---
zmodload zsh/terminfo 2>/dev/null
[[ -n "${terminfo[kcuu1]-}" ]] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
[[ -n "${terminfo[kcud1]-}" ]] && bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
bindkey '^[^?' backward-kill-word # Alt/Option + Backspace（常見序列）
bindkey '^[\x7f' backward-kill-word # 有些終端會是這個
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^K' kill-line

# --- history ---
export HISTFILE=~/.zsh_history
export HISTSIZE=3000
export SAVEHIST=3000

# --- options ---
setopt auto_cd auto_pushd pushd_ignore_dups
setopt always_to_end
setopt extended_history hist_ignore_all_dups hist_ignore_dups hist_ignore_space inc_append_history share_history
setopt interactive_comments complete_in_word

# --- external tools ---
command -v fzf >/dev/null && source <(fzf --zsh)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"

# --- syntax highlighting 最後載入 ---
znap source zsh-users/zsh-syntax-highlighting
