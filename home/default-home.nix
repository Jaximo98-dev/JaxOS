{lib, pkgs, username, device, ... }:{

  imports = 
  [
    ./modules/xsession.nix      # Initial xsession

    ./modules/zsh.nix           # Shell interpreter
    ./modules/alacritty.nix     # Terminal emulator
    ./modules/tmux.nix          # Session manager

    ./modules/neovim.nix        # Code editor
    ./modules/polybar.nix       # Bar
    ./modules/git.nix       # Bar

  ];

  home = {
    username = username;

    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager
      gnumake
      thefuck
      cowsay      # Para probar cosas
      tldr

      rofi        # Alternativa a dmenu
      
      # Editors
      vscodium
      zed-editor

      # Apps
      firefox     # TODO: Cambiar por otro fork
      #chrome     # TODO: Buscar fork limpio, como mercury
      discord     # TODO: Buscar como poner betterdiscord
      

      (if(device == "laptop") then [brightnessctl] else [])     # Keyboad backlight for laptop
    ];

    stateVersion = "24.05";
  };
}
