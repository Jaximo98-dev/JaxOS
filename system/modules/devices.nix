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

  systemd.services.xrandr-service = {
    description = "Configure display resolution and refresh rate using xrandr";
    after = [ "display-manager.service" ];
    wants = [ "display-manager.service" ];  # Asegura que se inicie después de display-manager
    requires = [ "display-manager.service" ];  # Asegura que display-manager se inicie antes
    serviceConfig.Type = "oneshot";  # Esto ejecutará el comando una vez y luego saldrá

    script = ''
      export DISPLAY=:0
      ${pkgs.xorg.xrandr}/bin/xrandr --output DP-3 --mode 2560x1440 --rate 144
    '';
  };
}