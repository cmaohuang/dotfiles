for file in ~/.{aliases,bashrc,exports,functions,myprofile.sh}; do
  [[ -s "$file" ]] && source "$file"
done
