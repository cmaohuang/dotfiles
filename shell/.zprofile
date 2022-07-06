for file in ~/.{aliases,exports,functions,myprofile.sh}; do
  [[ -s "$file" ]] && source "$file"
done
eval "$(/opt/homebrew/bin/brew shellenv)"
