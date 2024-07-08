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

  # Configure and enable Networking
  networking.networkmanager.enable = true;
  networking.hostName = "Jaximo_dev";
  networking.wireless.enable = if (device == "laptop") then true else false;

  # pkgs.brightnessctl is in charge of keyboard backlight for laptop, check in home.
}