{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "matthew";
  home.homeDirectory = "/home/matthew";

  # Determines Home Manager release version
  # Do not change value even if you update Home Manager
  # If you want to update, make sure to check release notes first!
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Allow unfree software
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Define packages for installation
  home.packages = [
    
    # Compilers/Libraries
    pkgs.gcc
    pkgs.go
    pkgs.openjdk
    pkgs.nodejs
    pkgs.rustup

    # CLI tools
    pkgs.btop
    pkgs.distrobox
    pkgs.fastfetch
    pkgs.lazygit
    pkgs.neovim
    pkgs.rclone
    pkgs.starship
    pkgs.tailscale
    pkgs.zellij
    
    # GUI
    pkgs.anki
    pkgs.discord
    pkgs.flameshot
    pkgs.fractal
    pkgs.gnome-boxes
    pkgs.localsend
    pkgs.mullvad-vpn
    pkgs.obsidian
    pkgs.obs-studio
    pkgs.qbittorrent
    pkgs.telegram-desktop
    pkgs.vlc
    pkgs.vscodium

    # Other
    pkgs.nerd-fonts.blex-mono
  ];

  # Dotfile management
  home.file = {
  
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
