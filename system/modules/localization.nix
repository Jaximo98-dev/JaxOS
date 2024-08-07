#
# Localization of keyboard and timezone
#
{ config, pkgs, ... }:
{
  # Configure console keymap
  console.keyMap = "es";
	
	# Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_ES.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Set xservices layout
  services.xserver.xkb.layout = "es(winkeys)";
  #services.xserver.xkb.variant = "nodeadkeys";
  services.xserver.xkb.model = "pc104alt";
}