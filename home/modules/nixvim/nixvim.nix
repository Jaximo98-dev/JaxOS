{ config, pkgs, lib, ...}:

{

  imports = [
    ./telescope.nix
  ];

  home.packages = with pkgs; [
    lua
  ];


  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    viAlias = true;
    vimAlias = true;
  };
}

