#
# Window manager using i3.
#
{ config, pkgs, ... }:
{
  # unknown
  environment.pathsToLink = ["/libexec"];

  # i3 configuration, uses i3lock
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ i3lock ];
    };
  };


  # Default session
  services.displayManager.defaultSession = "none+i3";


}
