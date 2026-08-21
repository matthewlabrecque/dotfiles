#!/bin/bash

set -euo pipefail

script_dir="${0:A:h}"
brew_bin="/opt/homebrew/bin/brew"
brew_shellenv='eval "$(/opt/homebrew/bin/brew shellenv)"'

# Install Xcode Command Line Tools if not already installed
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  for _ in {1..60}; do
    if xcode-select -p &>/dev/null; then
      break
    fi
    sleep 5
  done
  xcode-select -p &>/dev/null || {
    echo "Xcode Command Line Tools were not installed within five minutes."
    exit 1
  }
fi

# Install Homebrew if not already installed
if [[ ! -x "$brew_bin" ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$("$brew_bin" shellenv)"
grep -qxF "$brew_shellenv" "$HOME/.zprofile" 2>/dev/null ||
  echo "$brew_shellenv" >> "$HOME/.zprofile"
grep -qxF 'export PATH="$HOME/go/bin:$PATH"' "$HOME/.zprofile" 2>/dev/null ||
  echo 'export PATH="$HOME/go/bin:$PATH"' >> "$HOME/.zprofile"

# Install applications via Brewfile
if [[ -f "$script_dir/Brewfile" ]]; then
  echo "Installing applications from Brewfile..."
  "$brew_bin" bundle --file="$script_dir/Brewfile"
else
  echo "Brewfile not found at $script_dir/Brewfile"
  exit 1
fi

# Install LSPs for Neovim
rustup default stable
rustup component add rust-analyzer
npm install --global pyright

# Create additional directories
mkdir -p "$HOME/scripts" "$HOME/University"

# Disable Press and Hold so keyboard navigation works
defaults write -g ApplePressAndHoldEnabled -bool false

# Add in dotfiles to correct locations


echo "Configuration complete!"
echo "Programs that need to be installed manually:"
echo "  - Logic Pro"
echo "  - Final Cut Pro"
echo "  - FL Studio 26"
echo "  - Fantastical"
echo ""
if [[ -t 0 ]]; then
  read -q "reply?Reboot now? [y/N]"
  echo
  if [[ "$reply" == "y" || "$reply" == "Y" ]]; then
    sudo reboot
  fi
fi
