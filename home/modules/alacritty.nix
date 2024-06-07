{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    background_opacity = 0.6;
  };
}