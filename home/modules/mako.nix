{ config, pkgs, ...}:

{
  services.mako = {
    enable = true;

    font = "JetBrainsMono Nerd Font 10";
    backgroundColor = "#282828E6";
    progressColor = "over #8ec07cE6";
    height = 500;
    width = 500;

    defaultTimeout = 5000;

    extraConfig = ''
    [urgency=normal]
    border-color=#fe8019

    [urgency=high]
    border-color=#fb4934
    default-timeout=0
    '';
  };
}