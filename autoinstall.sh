#!/bin/bash

set -euo pipefail

PACMAN_PKGS=(
		"anki"
		"base-devel"
		"bat"
		"btop"
		"eog"
		"fastfetch"
		"fd"
		"fuzzel"
		"feishin"
		"ffmpeg"
		"foot"
		"fzf"
		"git"
		"gnome-disk-utility"
		"go"
		"greetd"
		"greetd-agreety"
		"greetd-tuigreet"
		"julia"
		"keepassxc"
		"lazygit"
		"librewolf"
		"nautilus"
		"neovim"
		"niri"
		"obs-studio"
		"obsidian"
		"picard"
		"python"
		"qbittorrent"
		"reaper"
		"ripgrep"
		"rustup"
		"starship"
		"tailscale"
		"tree"
		"ttf-cascadia-code-nerd"
		"typst"
		"vim"
		"vlc"
		"vlc-plugins-all"
		"xwayland-satellite"
		"zsh"
		"zsh-autosuggestions"
		"zsh-syntax-highlighting"
)

AUR_PKGS=(
		"vesktop-bin"
		"noctalia-bin"
		"gostow-bin"
		"zettk-cli-bin"
		"thinkfan"
)
# Perform full system update before continuing
sudo pacman -Syu --noconfirm

# Ensure we're in the home directory
cd /home/"$USER"

# Install Paru if not already installed
if ! command -v paru &>/dev/null; then
		PARU_BUILD_DIR="$(mktemp -d)"
		git clone https://aur.archlinux.org/paru.git "$PARU_BUILD_DIR/paru"
		(cd "$PARU_BUILD_DIR/paru" && makepkg -si --noconfim) # Note that this is a subshell
		rm -rf "$PARU_BUILD_DIR"
fi

# Install packages
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
paru -S --needed --noconfirm "${AUR_PKGS[@]}"

# Write GreetD configuration
tee /etc/greetd/config.toml << EOF
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `/bin/sh`
# with whatever you want started, such as `sway`.
command = "tuigreet --time --remember --cmd niri-session"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
user = "greeter"

[initial_session]
command = "tuigreet --time --remember --cmd niri-session"
user = "$USER"
EOF

systemctl enable greetd.service

# Install LSPs for Neovim
rustup default stable
rustup install
rustup component add rust-analyzer
go install golang.org/x/tools/gopls@latest

# Clone and move dotfiles
git clone https://github.com/matthewlabrecque/dotfiles.git 
(cd dotfiles && gostow *)

# Create additional directories
mkdir -p scripts University

# Set ZSH as default shell
if [[ "$SHELL" != *"zsh"* ]]; then
  sudo chsh -s "$(which zsh)" "$USER"
fi

# Enable the firewall
sudo ufw enable

# Reboot system
echo "Configuration complete!"
for i in {5..0}; do
		echo "Rebooting system in "$i" seconds"
		sleep 1
done
reboot
