# wm, usando i3.
{ config, pkgs, ... }:
{
  # i3 configuration
  environment.pathsToLink = ["/libexec"];

  # Configure keymap in X11
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      config.terminal = "alacritty -e zsh";
      extraPackages = with pkgs; [ i3lock i3status];
    };
  };

  # Default session
  services.displayManager.defaultSession = "none+i3";
}