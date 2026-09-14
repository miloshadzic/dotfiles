#!/bin/sh
# Link dotfiles into $HOME with GNU Stow. Safe to re-run.
set -e
cd "$(dirname "$0")"

common="fish nvim git bash eza"

case "$(uname)" in
  Darwin)
    command -v stow >/dev/null || brew install stow
    packages="$common ghostty kitty"
    ;;
  Linux)
    command -v stow >/dev/null || sudo dnf install -y stow fish neovim git
    packages="$common"
    ;;
esac

stow --restow $packages

# Links to things outside this repo, which stow won't manage
link_if_exists() { [ -e "$1" ] && ln -sfn "$1" "$2" || true; }
link_if_exists ~/src/dj_scripts ~/.config/fish/functions/dj_scripts
link_if_exists /Applications/OrbStack.app/Contents/Resources/completions/fish/kubectl.fish \
  ~/.config/fish/completions/kubectl.fish

if command -v fish >/dev/null; then
  fish -c '
    if not type -q fisher
      curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    end
    fisher update
  '
fi
