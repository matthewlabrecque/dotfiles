#!/bin/bash

TOOLCHAINS=("clang" "gcc" "go" "java-21-openjdk-devel" "nodejs" "python3-pip" "rustup")

TERMINAL_APPLICATIONS=("btop" "distrobox" "fastfetch" "git" "kitty" "neovim" "rclone" "starship" "tailscale" "zellij" "zsh")

GUI_APPS=("brave-browser" "codium" "dconf-editor" "fractal" "obs-studio" "qbittorrent" "steam" "virt-manager" "vlc")

OTHER_PACKAGES=("fzf" "qemu-kvm" "qemu-img" "libvirt")

FLATPAKS=("com.bitwarden.desktop" "md.obsidian.Obsidian" "org.prismlauncher.PrismLauncher" "org.telegram.desktop")

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
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install dnf-plugins-core -y

# Add in any required repositories
echo "Adding in third-party repositories"
sudo dnf copr enable atim/starship
sudo dnf copr enable phracek/PyCharm
sudo dnf copr enable varlad/zellij
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
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
sudo dnf check-update

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

# Add in NerdFonts Manager Utility
echo "Installing NerdFonts"
wget -P /home/$USER/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/IBMPlexMono.zip
mkdir -p /home/$USER/Downloads/BlexMono
unzip /home/$USER/Downloads/IBMPlexMono.zip -d /home/$USER/Downloads/BlexMono
cp /home/$USER/Downloads/BlexMono/*.ttf /home/$USER/.local/share/fonts/
fc-cache -fv

#####################
###   CONFIGURE   ###
#####################

# Configure the terminal and shell environment
cat >>/home/$USER/.config/kitty/kitty.conf <<'EOF'
shell /usr/bin/zsh

# Optional: Performance optimizations
repaint_delay 10
input_delay 3
sync_to_monitor yes

# Optional: Hide Kitty's tab bar since Zellij handles tabs
tab_bar_style hidden

# BEGIN_KITTY_FONTS
font_family      family="BlexMono Nerd Font"
bold_font        auto
italic_font      auto
bold_italic_font auto
# END_KITTY_FONTS

# General customization
font_size 12.0
hide_window_decorations no
background_opacity 0.9
EOF

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Configure Neovim with LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Configure FastFetch
mkdir -p /home/$USER/.config/fastfetch
curl -o /home/$USER/.config/fastfetch/config.jsonc https://raw.githubusercontent.com/matthewlabrecque/dotfiles/refs/heads/main/global/fastfetch_config.txt
curl -o /home/$USER/.config/fastfetch/thinkpad-v.txt https://raw.githubusercontent.com/matthewlabrecque/dotfiles/refs/heads/main/laptop/thinkpad-v.txt

# Grab a couple GNOME Extensions, but enclose in trigger for if we're on GNOME
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
  echo "GNOME Desktop Environment detected, installing GNOME extensions"
  # Install System Monitor
  # Install Tiling Shell
fi

# Create my special directories
mkdir -p /home/$USER/repos/personal
mkdir -p /home/$USER/repos/ai-foundry
mkdir -p /home/$USER/University
mkdir -p /home/$USER/ObsidianVault

#####################
###    CLEANUP    ###
#####################

# Uninstall unused applications
sudo dnf remove firefox

# Reboot the system
sudo reboot now
