{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;
    };
  };
}