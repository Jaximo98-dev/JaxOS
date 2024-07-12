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
      thefuck
      cowsay          # Para probar cosas
      tldr
      btop            # Performance monitor
      brightnessctl   # Keyboad backlight for laptop
      rofi            # Alternativa a dmenu
      pavucontrol
      
      # Editors
      vscodium

      # Apps
      obsidian
      (discord.override {
        withOpenASAR = true;
      })
      
    ];

    stateVersion = "24.05";
  };
}
