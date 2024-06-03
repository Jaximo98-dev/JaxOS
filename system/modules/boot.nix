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
	};
}