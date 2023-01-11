[[ -d "$HOME/.zsh-plugins" ]] || mkdir "$HOME/.zsh-plugins"
for file in ~/.{aliases,exports,functions,myprofile.sh}; do
  [[ -s "$file" ]] && source "$file"
done
[ $(uname) = "Darwin" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
