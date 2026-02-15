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

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    pkgs.tailscale
    pkgs.zellij
    
    # GUI
    pkgs.anki
    pkgs.discord
    pkgs.fractal
    pkgs.gnome-boxes
    pkgs.localsend
    pkgs.mullvad-vpn
    pkgs.obsidian
    pkgs.obs-studio
    pkgs.qbittorrent
    pkgs.telegram-desktop
    pkgs.vlc
    pkgs.vscode

  ];

  # Dotfile management
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Manage environment
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
