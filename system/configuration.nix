{ config, pkgs, username, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./modules/wm.nix
      ./modules/localization.nix
      ./modules/devices.nix
      ./modules/boot.nix
    ];

  # Define a user account.
  users.users.${username} = {
    isNormalUser = true;
    description = "User ${username}";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.zsh;
  };


  # Las siguientes opciones solo las puede ejecutar ROOT, por eso no estan en modulos.

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable zsh.
  programs.zsh.enable = true;

  system.stateVersion = "24.05";

}