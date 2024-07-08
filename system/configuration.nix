{ config, pkgs, username, device, ... }:

{
  imports =
    [ 
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
  };

  # Set zsh as main shell. (Needs to be defined in this level)
  #programs.zsh.enable = true;
  #users.defaultUserShell = pkgs.zsh;

  # Fundamental nixos settings, do not change. 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";

}