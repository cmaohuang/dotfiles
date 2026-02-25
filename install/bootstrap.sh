#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/dotfiles"
REPO_URL="https://github.com/cmaohuang/dotfiles"
STOW_PACKAGES=(editor git homebrew ruby shell system tmux)

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "❌ Required command not found: $1"
        exit 1
    }
}

require_cmd git
require_cmd stow
require_cmd nvim

echo "==> Bootstrap dotfiles"

if [ -d "${DOTFILES_DIR}/.git" ]; then
    echo "==> dotfiles repo exists, updating..."
    git -C "$DOTFILES_DIR" pull --ff-only
elif [ -e "$DOTFILES_DIR" ]; then
    echo "❌ ${DOTFILES_DIR} exists but is not a git repo. Please check manually."
    exit 1
else
    echo "==> Cloning dotfiles..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

echo "==> Stowing packages..."
stow -d "$DOTFILES_DIR" -t "$HOME" "${STOW_PACKAGES[@]}"

echo "==> Linking global gitignore..."
ln -sfn "${DOTFILES_DIR}/git/.gitignore" "${HOME}/.gitignore"

echo "==> Installing lazy.nvim (plugin manager)..."
DATA_DIR="$(nvim --headless +'lua io.write(vim.fn.stdpath("data"))' +qa 2>/dev/null)"
if [ -z "$DATA_DIR" ]; then
    echo "❌ Failed to resolve Neovim data dir via stdpath('data')."
    exit 1
fi

LAZY_DIR="$DATA_DIR/lazy/lazy.nvim"
if [ ! -d "$LAZY_DIR" ]; then
    git clone --filter=blob:none https://github.com/folke/lazy.nvim.git \
        --branch=stable "$LAZY_DIR"
else
    echo "==> lazy.nvim already exists: $LAZY_DIR"
fi

echo "✅ Complete setup dotfiles + Neovim!"

