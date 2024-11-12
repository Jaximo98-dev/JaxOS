{lib, pkgs, username, device, ... }:{

  imports = 
  [
    #ARCHIVED: ./modules/xsession.nix      # Initial xsession
    ./modules/hyprland.nix

    ./modules/zsh.nix           # Shell interpreter
    ./modules/zoxide.nix
    #ARCHIVED: ./modules/alacritty.nix     # Terminal emulator
    ./modules/wezterm.nix
    #ARCHIVED: ./modules/tmux.nix          # Session manager

    #./modules/neovim.nix        # code editor 1
    #ARCHIVED: ./modules/polybar.nix       # bar
    ./modules/git.nix           # git
    ./modules/btop.nix          # Performance monitor
    ./modules/firefox.nix       # firefox

  ];

  home = {
    username = username;

    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager
      gnumake

      tree
      tealdeer
      thefuck
      ncdu
      brightnessctl   # Keyboad backlight for laptop
      rofi-wayland            # Alternativa a dmenu
      pavucontrol

      kitty
      

      #LSP and Compilares and Languages
      nil
      clang
      go
      jetbrains.jdk # Java modificado para usar sus IDEs mejor...
      maven
      python3
      
      # Editors
      vscodium
      jetbrains.goland
      #jetbrains.clion
      jetbrains.idea-ultimate

      # Apps
      vlc
      obsidian
      gnome.nautilus
      vesktop
      
    ];

    stateVersion = "24.05";
  };
}
