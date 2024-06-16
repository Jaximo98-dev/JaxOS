#Bootloader, con GRUB.
{ config, pkgs, ... }:
{
	
	#boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.loader.grub = {
		enable = true;
		useOSProber = true;
		efiSupport = true;
		device = "nodev";
		#gfxmodeEfi = "2560x1440"; #TODO: Hacerlo adaptativo
		fontSize = 42;
		configurationLimit = 20;
		extraEntriesBeforeNixOS = true;
		default=-1;
		/* theme = pkgs.stdenv.mkDerivation {
				pname = "grub_bios_theme";
				version = "1";
				src = pkgs.fetchFromGitHub {
					owner = "Blaysht";
					repo = "grub_bios_theme";
					rev = "035554c30df6a10158a5a71acfbc4975045fc7ac";
					hash = "sha256-kYcEMCV9ipwPGgfAwOtFgYO4eHZxkUS97tOr0ft4rUE=";
					};
 			  installPhase = ''
            mkdir -p $out/share/grub/themes/CRT-Amber
            cp -r * $out/share/grub/themes/CRT-Amber
        '';
			}; */
	};
}