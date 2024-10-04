{ config, pkgs, device, ... }:
{
	
	# Define GRUB as boot loader.
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.timeout = 15;

	boot.loader.grub = {
		enable = true;	
		useOSProber = true;
		efiSupport = true;
		device = "nodev";
		gfxmodeEfi = if (device == "desktop") then "2560x1440" else "1920x1080";
		fontSize = 42;
		configurationLimit = 20;
		extraEntriesBeforeNixOS = true;
		default = 21;
	};

  # Habilitar soporte para NTFS al arranque
  boot.supportedFilesystems = [ "ntfs" ];

	# Theming
/* 	boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
  	pname = "distro-grub-themes";
  	version = "3.1";
  	src = pkgs.fetchFromGitHub {
			owner = "Blaysht";
			repo = "grub_bios_theme";
			rev = "035554c30df6a10158a5a71acfbc4975045fc7ac";
			hash = "sha256-kYcEMCV9ipwPGgfAwOtFgYO4eHZxkUS97tOr0ft4rUE=";
		};
 	 installPhase = "cp -r customize/nixos $out";
}; */
}