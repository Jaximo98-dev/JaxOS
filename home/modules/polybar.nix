{ config, pkgs, ...}:

{
  services.polybar = {
    enable = true;
    script = ''
polybar top &
polybar bottom &
'';
  };
}