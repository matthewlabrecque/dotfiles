#!/bin/bash

TOOLCHAINS=("clang" "gcc" "go" "julia" "nodejs" "python3-pip" "rustup")

TERMINAL_APPLICATIONS=("btop" "distrobox" "fastfetch" "git" "kitty" "neovim" "rclone" "starship" "tailscale" "zellij" "zsh")

GUI_APPS=("brave-browser" "codium" "dconf-editor" "fractal" "obs-studio" "mullvad-vpn" "qbittorrent" "steam" "virt-manager" "vlc")

OTHER_PACKAGES=("fzf" "qemu-kvm" "qemu-img" "libvirt")

FLATPAKS=("com.bitwarden.desktop" "md.obsidian.Obsidian" "in.cinny.Cinny" "org.prismlauncher.PrismLauncher" "org.telegram.desktop")

#####################
###     SETUP     ###
#####################

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

Jarvis, set up my computer you dipshit.
EOF

sleep 10

# Enable Flathub and RPM Fusion
echo "Enabling Flathub and RPM Fusion repos"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -yq
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install dnf-plugins-core -yq

# Add in any required repositories
echo "Adding in third-party repositories"
sudo dnf copr enable atim/starship -yq
sudo dnf copr enable varlad/zellij -yq
sudo dnf copr enable scottames/ghostty -yq
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -yq
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo -yq
sudo tee -a /etc/yum.repos.d/vscodium.repo <<'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

# Perform a database update
echo "Updating database"
sudo dnf check-update -yq

#####################
###    INSTALL    ###
#####################

# Install dnf packages
echo "Installing core compilers and toolchains"
for package in "${TOOLCHAINS[@]}"; do
  sudo dnf install "$package" -y
done

echo "Installing terminal applications and services"
for package in "${TERMINAL_APPLICATIONS[@]}"; do
  sudo dnf install "$package" -y
done

echo "Installing any other dependencies before installing GUI applications"
for package in "${OTHER_PACKAGES[@]}"; do
  sudo dnf install "$package" -y
done

echo "Installing graphical applications"
for package in "${GUI_APPS[@]}"; do
  sudo dnf install "$package" -y
done

# Install flathub packages
echo "Installing Flatpaks"
for package in "${FLATPAKS[@]}"; do
  flatpak install "$package" -y
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
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
starship preset gruvbox-rainbow -o ~/.config/starship.toml
curl -o /home/$USER/.config/ghostty/config https://gitlab.com/kanixos/dotfiles/-/blob/bbe8260be71219910d98f8a6a3e150dca702f572/general/ghostty_config.txt

# Configure Neovim with LazyVim
git clone -q https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Set LazyVim color theme to Gruvbox
cat >>/home/$USER/.config/nvim/lua/plugins/colorscheme.lua <<EOF
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  }
}
EOF

# Configure FastFetch
mkdir -p /home/$USER/.config/fastfetch
curl -o /home/$USER/.config/fastfetch/config.jsonc https://gitlab.com/kanixos/dotfiles/-/blob/bbe8260be71219910d98f8a6a3e150dca702f572/general/fastfetch_config.txt
curl -o /home/$USER/.config/fastfetch/thinkpad-v.txt https://gitlab.com/kanixos/dotfiles/-/blob/bbe8260be71219910d98f8a6a3e150dca702f572/laptop/thinkpad-v.txt

# GNOME Specific Configurations
# Mainly just setting some keybinds
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  echo "GNOME Desktop Environment detected, performing GNOME configurations"
  for i in {1..9}; do
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
  done
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
fi

# Create my special directories
mkdir -p /home/$USER/repos/personal
mkdir -p /home/$USER/repos/ai-foundry
mkdir -p /home/$USER/University
mkdir -p /home/$USER/ObsidianVault

#####################
###    CLEANUP    ###
#####################

# Telete the temp directories
sudo rm -rf /tmp/font

# Uninstall unused applications
sudo dnf remove firefox -y

# GNOME Specific Cleanup (A lot of these applications are installed by default)
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  sudo dnf remove gnome-calendar gnome-clocks gnome-weather gnome-maps gnome-contacts gnome-boxes -y
fi

# Reboot the system
echo "Setup complete! Rebooting system!"
sleep 5
sudo reboot now
