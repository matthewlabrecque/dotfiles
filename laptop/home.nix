{ config, pkgs, ... }:

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
    pkgs.lazygit
    # pkgs.kitty # Compatability issue
    pkgs.neovim
    pkgs.rclone
    pkgs.starship
    pkgs.tailscale
    pkgs.zellij
    
    # GUI
    pkgs.anki
    # pkgs.brave # Compatability issue
    pkgs.discord
    pkgs.flameshot
    pkgs.fractal
    pkgs.gnome-boxes
    pkgs.localsend
    pkgs.mullvad-vpn
    # pkgs.obsidian # Requires OpenGL
    pkgs.obs-studio
    pkgs.prismlauncher
    pkgs.qbittorrent
    pkgs.telegram-desktop
    pkgs.vlc
    pkgs.vscodium

    # Other
    pkgs.nerd-fonts.blex-mono
  ];

  # ZSH Configuration
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };
    sessionVariables = {
      XDG_DATA_DIRS = "{config.home.homeDirectory}/.nix-profile/share:$XDG_DATA_DIRS";
    };
    shellAliases = {
      ll = "ls -lF";
      vim = "nvim";
      upgrade-nix = "determinate-nixd upgrade";
    };
    initContent = ''
      # opencode PATH
      export PATH=/home/matthew/.opencode/bin:$PATH
      [[ $- == *i* ]] && eval "$(starship init zsh)"
    '';
  };

  # Git configuration
  programs.git = {
    enable = true;
    settings = {
      user.name = "Matthew Labrecque";
      user.email = "mail@mlabrecque.dev";
    };
  };

  # Fastfetch Configuration
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${config.home.homeDirectory}/.config/fastfetch/thinkpad-v.txt";
        color = {
          "1" = "white";
          "2" = "bright_red";
        };
        padding = {
          top = 1;
        };
      };
      display = {
        separator = " -> ";
      };
      modules = [
        "break"
        "title"
        "separator"
        {
          type = "os";
          key = " OS";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = "├";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "├󰏖";
          keyColor = "yellow";
          format = "{5} (rpm), {nix-all} (nix), {flatpak-all} (flatpak)";
        }
        {
          type = "shell";
          key = "└";
          keyColor = "yellow";
        }
        "break"
        {
          type = "wm";
          key = " DE/WM";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = "├󰧨";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "├󰉼";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "├󰀻";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "└";
          keyColor = "blue";
        }
        "break"
        {
          type = "host";
          key = "󰌢 PC";
          keyColor = "green";
          format = "{3}";
        }
        {
          type = "cpu";
          key = "├󰻠";
          keyColor = "green";
          format = "{1}";
        }
        {
          type = "gpu";
          key = "├󰍛";
          keyColor = "green";
          format = "{2}";
        }
        {
          type = "disk";
          key = "├";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "├󰑭";
          keyColor = "green";
        }
        {
          type = "swap";
          key = "├󰓡";
          keyColor = "green";
        }
        {
          type = "display";
          key = "├󰍹";
          keyColor = "green";
          format = "{2}p";
        }
        {
          type = "uptime";
          key = "└󰅐";
          keyColor = "green";
        }
        "break"
        "colors"
      ];
    };
  };
  
  # Dotfile management
  home.file = {
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
