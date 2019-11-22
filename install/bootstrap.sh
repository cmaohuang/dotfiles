#!/usr/bin/env bash

DOTFILES_DIR=~/dotfiles
if [ -e "$DOTFILES_DIR" ]; then
  echo "$DOTFILES_DIR already exists!"
  exit 1
fi

hash git 2>/dev/null || { echo >&2 "Require git but it's not installed.  Aborting."; exit 1; }
hash stow 2>/dev/null || { echo >&2 "Require stow but it's not installed.  Aborting."; exit 1; }

echo "Begin fetching dotfiles..."
if ! [ -e "$DOTFILES_DIR" ]; then
  mkdir -p "$DOTFILES_DIR"
  git clone https://github.com/cmaohuang/dotfiles "$DOTFILES_DIR"
fi
echo "fetching dotfiles done."

stow -d ~/dotfiles editor git homebrew ruby screen shell system tmux vim
ln -s "${DOTFILES_DIR}/git/.gitignore" ~/.gitignore

echo "Complete setup dotfiles!"
