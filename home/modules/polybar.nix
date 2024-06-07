{ config, pkgs, ...}:

{
  services.polybar = {
    enable = true;
    script = ''
    polybar top &
    polybar bottom &
    '';
  
    settings = {

      "bar/mybar" = {
        scroll-up = "#i3.prev";
        scroll-down = "#i3.next";
      };

      "module/i3" = {
        type = internal/i3;
        ws-icon-0 = "1️⃣";
      };


    };
  };
}