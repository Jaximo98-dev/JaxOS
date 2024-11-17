{ config, pkgs, lib, ...}:

{
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    viAlias = true;
    vimAlias = true;
  };
}

