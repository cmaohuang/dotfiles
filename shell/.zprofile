for file in ~/.{aliases,exports,functions,myprofile.sh}; do
  [[ -s "$file" ]] && source "$file"
done
