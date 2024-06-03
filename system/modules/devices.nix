# Devices, para dispositivos de red, audio, etc...
{ config, pkgs, ... }:
{
  # Enable audio devices
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.enableAllFirmware = true;
  hardware.pulseaudio.enable = true;

  # Configure and enable Networking
  networking.networkmanager.enable = true;
  networking.hostName = "Jaximo-OS"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}