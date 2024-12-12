#
# Generates the filesystem directories and stuff.
# 
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inotify-tools
  ];

  systemd.tmpfiles.rules = [
    "d /home/jaximo/development/ 0777 jaximo users"
    "d /home/jaximo/development/playground 0777 jaximo users"
    "d /home/jaximo/development/projects 0777 jaximo users"

    "d /home/jaximo/personal/ 0777 jaximo users"
    "d /home/jaximo/personal/vaults/ 0777 jaximo users"
    "d /home/jaximo/personal/scratchpad/ 0777 jaximo users"

    "d /home/jaximo/university/ 0777 jaximo users"
    "d /home/jaximo/university/scratchpad/ 0777 jaximo users"
  ];
}
