{lib, pkgs, username, ... }:{

  imports = 
  [
    ./modules/zsh.nix # Shell interpreter
    ./modules/alacritty.nix # Terminal emulator
    ./modules/tmux.nix # Session manager
    
    ./modules/neovim.nix # Code editor
    ./modules/polybar.nix # Bar

  ];

  home = {
    username = username;

    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager
      git
      gnumake
      thefuck

      cowsay # Para probar cosas
      tldr

      rofi # Alternativa a dmenu
      
      # Editors
      vscodium

      # Apps
      firefox # TODO: Cambiar por otro fork
      #chrome # TODO: Buscar fork limpio, como mercury
      discord # TODO: Buscar como poner betterdiscord
      
    ];

    stateVersion = "24.05";
  };
}
