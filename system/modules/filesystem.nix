#
# Generates the filesystem directories and stuff.
# 
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inotify-tools
  ];

  systemd.tmpfiles.rules = [
    "d /home/jaximo/development 0777 jaximo users"
    "d /home/jaximo/development/playground 0777 jaximo users"
    "d /home/jaximo/development/projects 0777 jaximo users"

    "d /home/jaximo/personal/vaults/ 0777 jaximo users"
    "d /home/jaximo/personal/scratchpad/ 0777 jaximo users"

    "d /home/jaximo/university/ 0777 jaximo users"
  ];

  # Clones all configured repos into my predifined paths
  systemd.services.clone-repos = {
    description = "Clone personal repos, checks for Github auth";
    wantedBy = [ "multi-user.target" "systemd-tmpfiles-setup.service" ];
    serviceConfig = {
          User = "jaximo";
    Group = "users";
      ExecStart = "${pkgs.bash}/bin/bash /home/jaximo/JaxOS/scripts/auto-clone.sh";
      Environment = "PATH=${pkgs.git}/bin:${pkgs.bash}/bin:${pkgs.coreutils}/bin:$PATH";
    };
    
  };

  # Pushes to git any changes detected.
  systemd.services.auto-git-sync = {
    description = "Auto Git Sync for Vaults and University Repositories";
    wantedBy = [ "multi-user.target" "systemd-tmpfiles-setup.service" ];
    serviceConfig = {
          User = "jaximo";
    Group = "users";
      ExecStart = "${pkgs.bash}/bin/bash /home/jaximo/JaxOS/scripts/auto-git-sync.sh";
      Restart = "always";
      Environment = "PATH=${pkgs.git}/bin:${pkgs.bash}/bin:${pkgs.coreutils}/bin:$PATH";
    };
    
  };

}