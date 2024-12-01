#
# Configuration related to drivers and devices, like audio, wifi, video, etc
#
{ config, pkgs, device, ... }:
{
  # Enable audio devices
  nixpkgs.config.pulseaudio = true;
  hardware.enableAllFirmware = true;
  
}