{ config, pkgs, ...}:

{
  programs.mako = {
    enable = true;

    height = 500;
    width = 500;
  };
}