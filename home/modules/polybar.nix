{ config, pkgs, device, ...}:
#https://github.com/souravrs999/Dot-files/blob/master/polybar/config https://myrices.datsfilipe.dev/ 
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  
    script = "polybar bar &";

    settings = {

      "bar/bar" = {
        font-0 = "JetBrains Mono Nerd Font:weight=bold:size=10;2.25";
        scroll-up = "#i3.prev";
        scroll-down = "#i3.next";
        fixed-center = true;
        width = "100%";
        height = "30";

        background = "#282828";
        foreground = "#EBDBB2";
        radius = 0;
        padding-left = 1;
        padding-right = 1;

        separator = " | ";

        module-margin = 0;
        modules-left = "i3";
        modules-center = "date";
        modules-right = if(device == "laptop") then "network-wire network-wireless cpu memory battery volume" else "network-wire cpu memory volume";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 3;
        format = "<label>";
        label = "RAM %gb_used%/%gb_free%";
        label-padding = 1;
      };

      "module/network-wire" = {
        type = "internal/network";
        interval = 3;
        interface = "eth0";
        accumulative-stats = true;
        label-connected = "Net(W) %downspeed:8%";
        label-disconnected = "";
        format-connected = "<label-connected>";
        format-disconnected = "";
      };

      "module/network-wireless" = {
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
        battery = "BAT1";
        adapter = "ADP1";
        time-format = "%H:%M";
        format-charging = "<label-charging>";
        format-discharging = "<label-discharging>";

        label-charging = "Charging %percentage%%";
        label-charging-foreground = "#B8BB26";
        label-charging-padding = 1;

        label-discharging = "Discharging %percentage%%";
        label-discharging-padding = 1;
        label-full = "Fully charged";
        label-full-padding = 1;
      };

      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        label-focused = "%index%";
        label-focused-foreground = "#B8BB26";
        label-focused-background = "#282828";
        label-focused-underline = "#fba922";
        label-focused-padding = 1;
        label-unfocused = "%index%";
        label-unfocused-padding = 1;
        label-visible = "%index%";
        label-visible-underline = "#555555";
        label-visible-padding = 1;
        label-urgent = "%index%";
        label-urgent-foreground = "#000000";
        label-urgent-background = "#98971A";
        label-urgent-padding = 1;
        
      };

      "module/volume" = {
        type = "internal/pulseaudio";
        format-volume = " Vol <label-volume>";
        label-muted-text = " Vol Muted";
        label-muted-foreground = "#555555";
        click-right = "pavucontrol &";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1.0;
        date = "%A, %d %B %H:%M";
        label= "%{A1:sh ~/JaxOS/scripts/polybar_obsidian_calendar.sh:} %date% %{A}";
      };


      #TODO: Finish this module https://github.com/polybar/polybar/wiki/Module:-backlight
      "module/backlight" = {
        type = "internal/backlight";
        backlight = "intel_backlight";
        format = "<label>";
        label = "Brightness %percentage%%";
        label-padding = 1;
      };

    };
  };
}