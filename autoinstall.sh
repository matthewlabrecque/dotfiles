#!/bin/zsh

set -euo pipefail


# Perform full system update before continuing
sudo pacman -Syu --noconfirm

# Ensure we're in the home directory
cd /home/"$USER"

# Install packages

# Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Install LSPs for Neovim
rustup default stable
rustup component add rust-analyzer
go install golang.org/x/tools/gopls@latest

# Clone and move dotfiles
git clone https://github.com/matthewlabrecque/dotfiles.git 
(cd dotfiles && gostow *)

# Create additional directories
mkdir -p scripts University

# Enable the firewall
sudo ufw enable

# Reboot system
echo "Configuration complete!"
for i in {5..0}; do
		echo "Rebooting system in "$i" seconds"
		sleep 1
done
reboot
