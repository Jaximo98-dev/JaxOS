{lib, pkgs, username, ... }:{

  imports = 
  [
    ./modules/zsh.nix # Shell interpreter
    ./modules/tmux.nix # Session manager
  ];

  home = {
    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager
      git
      gnumake

      cowsay # Para probar cosas
      tldr

      rofi # Alternativa a dmenu
      alacritty # Terminal emulator
      
      # Editors
      vscodium
      neovim

      # Apps
      firefox # TODO: Cambiar por otro fork
      #chrome # TODO: Buscar fork limpio, como mercury
      discord # TODO: Buscar como poner betterdiscord
      
    ];

    stateVersion = "24.05";
  };
}