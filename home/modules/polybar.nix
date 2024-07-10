{ config, pkgs, ...}:
#https://github.com/souravrs999/Dot-files/blob/master/polybar/config https://myrices.datsfilipe.dev/ 
{
  services.polybar = {
    enable = false;
    script = ''polybar -q -r bar'';
  
    settings = {

      "bar/bar" = {
        font-0 = "JetBrains Mono Nerd Font:size=10;2.25";
        scroll-up = "#i3.prev";
        scroll-down = "#i3.next";
        fixed-center = true;
        width = "100%";
        height = "30";

        #TODO: Colorme
        background = "#1d1f21";
        foreground = "#707880";
        radius = 0;
        padding-left = 1;
        padding-right = 1;
        module-margin = 0;

        modules-left = "i3";
        modules-center = "date";
        modules-right = "network cpu memory battery volume";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 3;
        format = "<label>";
        label = "RAM %gb_used%/%gb_free%";
        label-padding = 1;
      };

      "module/network" = {
        type = "internal/network";
        interval = 3;
        interface = "wlo1";
        accumulative-stats = true;
        label-connected = "Net %downspeed:8%";
        label-disconnected = "Net Disconnected";
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 0.5;
        format = "<label>";
        label = "CPU %percentage%%";
        label-padding = 1;
      };

      "module/battery" = {
        type = "internal/battery";
        full-at = 99;
        low-at = 15;
        battery = "BAT0";
        adapter = "ADP1";
        time-format = "%H:%M";
        format-charging = "<label-charging>";
        format-discharging = "<label-discharging>";

        label-charging = "Charging %percentage%%";
        label-charging-foreground = "#1DB954";
        label-charging-padding = 1;

        label-discharging = "Discharging %percentage%%";
        label-discharging-padding = 1;
        label-full = "Fully charged";
        label-full-padding = 1;
      };

      #TODO: Colorme
      "module/i3" = {
        type = "internal/i3";
        strip-wsnumbers = true;
        format = "<label-state> <label-mode>";
        label-focused = "%index%";
        label-focused-foreground = "#1DB954";
        label-focused-background = "#1d1f21";
        label-focused-underline = "#fba922";
        label-focused-padding = 1;
        label-unfocused = "%index%";
        label-unfocused-padding = 1;
        label-visible = "%index%";
        label-visible-underline = "#555555";
        label-visible-padding = 1;
        label-urgent = "%index%";
        label-urgent-foreground = "#000000";
        label-urgent-background = "#bd2c40";
        label-urgent-padding = 1;
        
      };

      "module/volume" = {
        type = "internal/pulseaudio";
        format.volume = "<ramp-volume> <label-volume>";
        label.muted.text = "🔇";
        label.muted.foreground = "#666";
        ramp.volume = ["🔈" "🔉" "🔊"];
        click.right = "pavucontrol &";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1.0;
        date = "%A, %d %B %I:%M %p";
      };

      #TODO: Finish this module https://github.com/polybar/polybar/wiki/Module:-backlight
      "module/backlight" = {
        type = "internal/backlight";
        backlight = "intel_backlight";
        format = "<label>";
        label = "Brightness %percentage%%";
        label-padding = 1;
      };

      #TODO: Add volume module
    };
  };
}