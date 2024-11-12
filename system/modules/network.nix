#
# Configure and set up networks.
#
{ config, pkgs, lib, device, ... }:
{
  # Configure and enable Networking
  networking.networkmanager.enable = true;
  networking.hostName = "Jaximo_dev";
}
