{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.background_opacity = 0.6;
    };
  };
}