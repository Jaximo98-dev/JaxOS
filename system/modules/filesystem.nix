#
# Generates the filesystem directories and stuff.
# NO ESTA AÑADIDO A CONFIGURATION.NIX
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inotify-tools
  ];

  systemd.tmpfiles.rules = [
    "d /home/jaximo/development 0755 user group"
    "d /home/jaximo/development/playground 0755 user group"
    "d /home/jaximo/development/projects 0755 user group"

    "d /home/jaximo/personal/vaults/ 0755 user group"
    "d /home/jaximo/personal/scratchpad/ 0755 user group"

    "d /home/jaximo/university/ 0755 user group"
  ];

  # Clones all configured repos into my predifined paths
  systemd.services.clone-repos = {
    description = "Clone personal repos, checks for Github auth";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
    ExecStart = "${pkgs.bash}/bin/bash /home/jaximo/JaxOS/scripts/auto-sync.sh";
    };
  };

  # Pushes to git any changes detected.
  systemd.services.auto-git-sync = {
    description = "Auto Git Sync for Vaults and University Repositories";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash /home/jaximo/JaxOS/scripts/auto-git-sync.sh";
      Restart = "always";
    };
  };

}