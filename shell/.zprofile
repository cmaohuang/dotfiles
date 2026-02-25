[[ -d "$HOME/.zsh-plugins" ]] || mkdir -p "$HOME/.zsh-plugins"

for file in ~/.{exports,myprofile.sh}; do
    [[ -s "$file" ]] && source "$file"
done

if [[ "$(uname)" == "Darwin" ]] && [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

