#
# Configure and set up networks.
#
{ config, pkgs, lib, device, ... }:
{
  # Configure and enable Networking
  networking.networkmanager.enable = true;
  networking.hostName = "Jaximo_dev";

  # Try to set up connection to eduroam, expected to run the installer original eduroam script first to generate wpa_supplicant.
  systemd.services.connect-eduroam = lib.mkIf (device == "laptop") {
    description = "Connect to EDUROAM WiFi network";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "~/JaxOS/scripts/eduroam_connect.sh";
      Type = "simple";
    };
  };

}
