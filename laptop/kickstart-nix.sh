#!/bin/bash

# Enable RPM Fusion and Flatpaks
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install dnf-plugins-core -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Add the Nix package manager, Home-Manager, and NixGL
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl
nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault

# Clone the dotfile repo and move the Nix config to the correct place
git clone https://github.com/matthewlabrecque/dotfiles.git /tmp
rm $HOME/.config/home-manager/home.nix
cp /tmp/dotfiles/laptop/home.nix $HOME/.config/home-manager/home.nix

# Deploy the nix configuration
home-manager switch -b backup

# Currently, Brave and Kitty have to be installed via DNF and not Nix
# Install Brave and Kitty
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
sudo dnf install kitty brave-browser -y

# TODO: Enable underlying VM drivers

# Install OpenCode via curl
curl -fsSL https://opencode.ai/install | bash

# Install LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Move dotfiles to correct spots
rm $HOME/.config/kitty/kitty.conf
cp /tmp/dotfiles/laptop/kitty.conf $HOME/.config/kitty/kitty.conf
cp /tmp/dotfiles/laptop/thinkpad-v.txt $HOME/.config/fastfetch/thinkpad-v.txt

# Clean up system from "bloatware" installed by Fedora COSMIC
sudo dnf remove firefox nheko thunderbird rhythmbox -y
rm -rf /tmp/dotfiles

# Create the directories for my files
mkdir -p $HOME/ObsidianVault/ $HOME/repos $HOME/University

# Reboot the system
sudo reboot
