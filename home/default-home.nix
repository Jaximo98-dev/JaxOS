{lib, pkgs, username, ... }: let
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
in { 

  imports = [
    ./modules/zsh.nix # Shell interpreter
  ];

  home = {



    inherit username;
    inherit homeDirectory;

    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager

      cowsay # Para probar cosas
      git
      rofi # Alternativa a dmenu
      alacritty # Terminal emulator
      tmux
      
      # Editors
      vscodium
      neovim

      # Apps
      firefox # TODO: Cambiar por otro fork
      #chrome # TODO: Buscar fork limpio, como mercury
      discord # TODO: Buscar como poner betterdiscord
      

    ];

    /* file = {
      "uwu.txt" = {
        text = ''
          #!/usr/bin/env bash

          echo "Hello, ${username}!"
          echo '*slaps roof* This script can fit so many lines in it'
        '';
        executable = true;
      };
    }; */

    stateVersion = "24.05";
  };
}