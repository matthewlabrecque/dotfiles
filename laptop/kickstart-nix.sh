#!/bin/bash

# ORDER OF INSTALLATION
#
# 1) Enable RPM Fusion and Flatpaks (Flathub)
# 2) Add the Brave repository
# 3) Add Nix package manager
# 4) Load Nix config and install
# 5) Install shell commands (such as opencode, starship, etc.)
# 6) Install Lazyvim
# 7) Make my directories for my basic files
# 8) Reboot the system

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
sudo dnf install zsh kitty git brave-browser -y
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
sudo nix-channel --update
sudo dnf remove firefox nheko thunderbird rhythmbox -y
cd $HOME/downloads/
git clone https://github.com/matthewlabrecque/dotfiles.git
rm $HOME/.config/home-manager/home.nix
cp laptop/home.nix $HOME/.config/home-manager/home.nix
cd $HOME
home-manager switch
curl -fsSL https://opencode.ai/install | bash
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
mkdir ObsidianVault repos University
sudo reboot
