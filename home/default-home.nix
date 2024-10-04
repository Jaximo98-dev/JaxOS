{lib, pkgs, username, device, ... }:{

  imports = 
  [
    ./modules/xsession.nix      # Initial xsession

    ./modules/zsh.nix           # Shell interpreter
    ./modules/alacritty.nix     # Terminal emulator
    ./modules/tmux.nix          # Session manager

    ./modules/neovim.nix        # code editor 1
    ./modules/polybar.nix       # bar
    ./modules/git.nix           # git
    ./modules/firefox.nix       # firefox

  ];

  home = {
    username = username;

    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager
      gnumake
      ntfs3g

      tree
      cowsay          # Para probar cosas
      tldr
      thefuck
      btop            # Performance monitor
      brightnessctl   # Keyboad backlight for laptop
      rofi            # Alternativa a dmenu
      pavucontrol
      zoxide
      feh
      vlc

      #LSP and Compilares and Languages
      nil
      clang
      go
      jetbrains.jdk # Java modificado para usar sus IDEs mejor...
      
      # Editors
      vscodium
      jetbrains.goland
      jetbrains.clion
      jetbrains.idea-ultimate

      # Apps
      obsidian
      gnome.nautilus
      (discord.override {
        withOpenASAR = true;
      })
      
    ];

    stateVersion = "24.05";
  };
}
