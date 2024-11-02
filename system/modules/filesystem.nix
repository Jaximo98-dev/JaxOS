#
# Generates the filesystem directories and stuff.
# NO ESTA AÑADIDO A CONFIGURATION.NIX
{ config, pkgs, ... }:
{
  systemd.tmpfiles.rules = [
    "d /var/foo 0755 user group"
  ];
}