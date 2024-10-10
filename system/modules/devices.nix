#
# Configuration related to drivers and devices, like audio, wifi, video, etc
#
{ config, pkgs, device, ... }:
{
  # Enable audio devices
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.enableAllFirmware = true;
  hardware.pulseaudio.enable = true;
  
}