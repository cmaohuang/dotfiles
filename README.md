# This dotfiles managed via GNU [stow](http://www.gnu.org/software/stow/)

## Prerequisite

`git`, `stow`, and `neovim` package

## Installation

`curl -sSL https://raw.githubusercontent.com/cmaohuang/dotfiles/master/install/bootstrap.sh | bash`

## Maintenance

### Apply / refresh symlinks

```bash
stow -R -d ~/dotfiles -t "$HOME" editor git homebrew ruby shell system tmux
ln -sfn ~/dotfiles/git/.gitignore ~/.gitignore
```

### Roll back (unstow)

```bash
stow -D -d ~/dotfiles -t "$HOME" editor git homebrew ruby shell system tmux
rm -f ~/.gitignore
```

### Dry-run before changing links

```bash
stow -n -v -d ~/dotfiles -t "$HOME" editor git homebrew ruby shell system tmux
```

## Reference

- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [skwp/dotfiles](https://github.com/skwp/dotfiles)
- [holman/dotfiles](https://github.com/holman/dotfiles)
- [xero/dotfiles](https://github.com/xero/dotfiles)
