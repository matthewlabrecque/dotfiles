#!/bin/bash

# Enable RPM Fusion (just in case)
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install zsh, kitty, brave browser and nix
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
sudo dnf install zsh kitty git brave-browser -y
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
sudo nix-channel --update

# Remove Preinstalled crap
sudo dnf remove firefox nheko thunderbird rhythmbox -y

# Clone dotfiles repo from GitHub
cd $HOME/downloads/
git clone https://github.com/matthewlabrecque/dotfiles.git

# Copy home.nix to location
rm $HOME/.config/home-manager/home.nix
cp laptop/home.nix $HOME/.config/home-manager/home.nix
cd $HOME
home-manager switch

# Install OpenCode

# Make my directories
mkdir ObsidianVault repos University

# Copy dotfiles

# Add starship

# Install LazyVim

# Reboot the system
sudo reboot
