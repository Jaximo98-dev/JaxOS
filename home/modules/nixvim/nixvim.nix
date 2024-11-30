{ config, pkgs, lib, ...}:

{

  imports = [
    ./telescope.nix
  ];


  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    viAlias = true;
    vimAlias = true;
  };
}

