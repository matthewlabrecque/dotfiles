#!/bin/bash

TOOLCHAINS=("clang" "gcc" "go" "julia" "rustup")

TERMINAL_APPLICATIONS=("btop" "fastfetch" "ghostty" "git" "neovim" "rclone" "starship" "tailscale" "zsh")

GUI_APPS=("mullvad-vpn" "qbittorrent" "vlc")

OTHER_PACKAGES=("fd" "fzf" "gh")

FLATPAKS=("com.bitwarden.desktop" "md.obsidian.Obsidian" "im.riot.Riot" "app.zen_browser.zen")

cat <<EOF
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡤⠤⠤⠤⠤⠤⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⠀⣴⣾⣿⣿⣷⠀⠀⠀⣼⣿⣿⣷⣦⠄⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠚⣆⠻⢿⣷⣾⡟⢀⣶⡀⢻⣿⣾⡿⠿⣠⡟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡞⠀⣠⡔⠋⠀⠸⠿⠇⠀⠙⠛⣦⡀⠻⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡤⢴⣧⠈⠙⢾⡙⣲⢒⣖⠒⡖⣲⣿⠋⠉⣼⠗⠒⣤⠀⠀⠀⠀
⠀⠀⠀⢠⣿⣤⣄⣹⠳⢤⣀⡈⠙⠚⠛⠒⠛⢉⣁⣤⠾⢁⣴⣿⡵⢄⠀⠀⠀
⠀⠀⣴⣾⣿⣿⡿⣿⣷⣶⣝⣻⣯⡉⠉⢩⡿⠟⣻⣥⣴⣾⣿⣿⣿⣶⢧⡀⠀
⠀⣼⣿⣿⣿⣿⡇⣿⠿⣿⣛⣛⣿⠉⠉⢻⠟⣛⣿⣿⡿⣟⣻⣿⣿⣿⣷⠹⡆
⢸⣁⣿⣿⣿⣿⣷⣾⣿⣿⣟⣫⣹⠀⠀⢸⣨⡍⣿⣿⣿⣿⣯⣿⣿⣿⣿⡇⡇
⠀⠙⢿⣿⢿⣿⣿⣿⣿⣿⣿⢻⣸⣀⣀⣸⣿⠹⣿⣿⣿⣿⣿⣿⣿⣿⢟⡽⠃
⠀⠀⠀⠙⠺⢿⡌⠙⣿⣿⢿⣌⣈⣹⣿⣿⣿⣾⣿⣿⣿⣿⢡⡿⣭⠟⠋⠀⠀
⠀⠀⠀⠀⠀⢀⡽⣿⣟⢻⣿⣿⣿⣿⣿⣿⣿⣿⠉⣿⣿⣿⣽⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣇⣿⠈⣿⣿⣿⣿⡏⣎⣿⣿⣿⠀⢻⣿⣿⣧⣇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⢿⡇⣽⣿⣿⣿⣿⣳⢻⣽⣿⣿⡦⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠻⠼⢥⣼⣿⣿⣿⣿⡽⠙⣽⣿⣿⣟⣈⣿⡯⠿⠟⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣴⠋⠉⠓⢯⡉⢻⠉⠉⠀⠀⠀⢩⠟⠉⠉⢩⣷⠒⠉⠲⢦⡀⠀⠀
⠀⠀⠀⠸⣤⣤⣤⣤⣤⣿⣿⡆⠀⠀⠀⠀⢼⣳⣿⡿⣧⣤⣤⣤⣤⣴⡃

"Welcome, I've been waiting for you..."

Jarvis, just set up the laptop you dipshit.
EOF

sleep 10

#####################
###     SETUP     ###
#####################

# Enable Flathub and RPM Fusion
echo "Enabling Flathub and RPM Fusion repos"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -yq
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install dnf-plugins-core -yq

# Add in any required repositories
echo "Adding in third-party repositories"
sudo dnf copr enable atim/starship -yq
sudo dnf copr enable scottames/ghostty -yq
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo -yq

# Perform a database update
echo "Updating database"
sudo dnf check-update --refresh -yq

#####################
###    INSTALL    ###
#####################

# Install packages
echo "Installing core compilers and toolchains"
for package in "${TOOLCHAINS[@]}"; do
  sudo dnf install "$package" -yq
done

echo "Installing terminal applications and services"
for package in "${TERMINAL_APPLICATIONS[@]}"; do
  sudo dnf install "$package" -yq
done

echo "Installing any other dependencies before installing GUI applications"
for package in "${OTHER_PACKAGES[@]}"; do
  sudo dnf install "$package" -yq
done

echo "Installing graphical applications"
for package in "${GUI_APPS[@]}"; do
  sudo dnf install "$package" -yq
done

# Install flatpaks
echo "Installing Flatpaks"
for package in "${FLATPAKS[@]}"; do
  flatpak install flathub "$package" -y
done

# Install any shell scripts I use
echo "Installing OpenCode"
curl -fsSL https://opencode.ai/install | bash

# Add the IBM Plex nerd font
echo "Adding IBM Plex Mono Nerd Font"
mkdir /tmp/font
wget -P /tmp/font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IBMPlexMono.zip
mkdir -p /home/$USER/Downloads/BlexMono
unzip /tmp/font/IBMPlexMono.zip -d /tmp/font/BlexMono
cp /tmp/font/BlexMono/*.ttf /home/$USER/.local/share/fonts/
fc-cache -fv

#####################
###   CONFIGURE   ###
#####################

# Configure the terminal and shell environment
sudo chsh -s $(which zsh)
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
starship preset gruvbox-rainbow -o ~/.config/starship.toml
wget -O /home/$USER/.config/ghostty/config https://raw.githubusercontent.com/matthewlabrecque/dotfiles/refs/heads/main/general/ghostty_config.txt

# Configure Neovim with LazyVim
git clone -q https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Set LazyVim color theme to Gruvbox
cat >>/home/$USER/.config/nvim/lua/plugins/colorscheme.lua <<EOF
return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedark").setup({
        style = "dark",
      })
      require("onedark").load()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
EOF

# Configure FastFetch
mkdir -p /home/$USER/.config/fastfetch
wget -O /home/$USER/.config/fastfetch/config.jsonc https://raw.githubusercontent.com/matthewlabrecque/dotfiles/refs/heads/main/general/fastfetch_config.txt
wget -O /home/$USER/.config/fastfetch/thinkpad-v.txt https://raw.githubusercontent.com/matthewlabrecque/dotfiles/refs/heads/main/laptop/thinkpad-v.txt

# GNOME Specific Configurations
# Mainly just setting some keybinds
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  echo "GNOME Desktop Environment detected, performing GNOME configurations"
  for i in {1..9}; do
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
  done
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
fi

# Create my special directories
mkdir -p /home/$USER/repos
mkdir -p /home/$USER/University
mkdir -p /home/$USER/ObsidianVault

#####################
###    CLEANUP    ###
#####################

# Delete the temp directories
sudo rm -rf /tmp/font

# Uninstall unused applications
sudo dnf remove firefox -y

# GNOME Specific Cleanup (A lot of these applications are installed by default)
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  sudo dnf remove gnome-calendar gnome-clocks gnome-weather gnome-maps gnome-contacts gnome-boxes -y
fi

# Reboot the system
echo "Setup complete! Rebooting the system."
sleep 5
sudo reboot now
