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
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Fan control
  programs.coolercontrol.enable = if(device == "laptop") then true else false;

  # Composer
  services.picom.enable = true;

  # Laptop performance profile
  services.tlp = {
      enable = if(device == "laptop") then true else false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
  };

  # Fonts
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  # Local clock for dualboot desync issues
  time.hardwareClockInLocalTime = true;

  # Fundamental nixos settings, do not change. 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";

}