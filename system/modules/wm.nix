#
# Window manager using i3.
#
{ config, pkgs, lib, ... }:
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

  # Graphics fix?
  services.xserver.videoDrivers = lib.mkIf (device == "laptop") [ "modesetting" ];


  # Default session
  services.displayManager.defaultSession = "none+i3";


}
