{ config, pkgs, ...}:
#https://github.com/souravrs999/Dot-files/blob/master/polybar/config https://myrices.datsfilipe.dev/ 
{
  services.polybar = {
    enable = true;
    script = ''polybar bottom &'';
  
    settings = {

      "bar/bar" = {
        font-0 = "JetBrains Mono Nerd Font:size=10;3";
        scroll-up = "#i3.prev";
        scroll-down = "#i3.next";
      };

      "module/i3" = {
        type = "internal/i3";
        ws-icon-0 = "[1]";
      };

      "module/volume" = {
        type = "internal/pulseaudio";
        format.volume = "<ramp-volume> <label-volume>";
        label.muted.text = "🔇";
        label.muted.foreground = "#666";
        ramp.volume = ["🔈" "🔉" "🔊"];
        click.right = "pavucontrol &";
      };

    };
  };
}