{lib, pkgs, username, device, ... }:{

  imports = 
  [
    ./modules/xsession.nix      # Initial xsession

    ./modules/zsh.nix           # Shell interpreter
    ./modules/alacritty.nix     # Terminal emulator
    ./modules/wezterm.nix
    ./modules/tmux.nix          # Session manager

    ./modules/neovim.nix        # code editor 1
    ./modules/polybar.nix       # bar
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
      cowsay          # Para probar cosas
      tldr
      thefuck    
      brightnessctl   # Keyboad backlight for laptop
      rofi            # Alternativa a dmenu
      pavucontrol
      zoxide
      feh

      #LSP and Compilares and Languages
      nil
      gcc
      clang
      go
      jetbrains.jdk # Java modificado para usar sus IDEs mejor...
      
      # Editors
      vscodium
      jetbrains.goland
      jetbrains.clion
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
