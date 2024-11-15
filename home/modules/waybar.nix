let
  colors = import ../themes/colors.nix;
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;

        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = [ "network" "backlight" "pulseaudio" "battery"  ];

        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "{essid} ";
          "format-ethernet" = "󰈁";
          "format-disconnected" = "";
          "tooltip-format"= "{ifname} via {gwaddr} 󰊗";
          "tooltip-format-wifi"= "{essid} ({signalStrength}%) ";
          "tooltip-format-ethernet"= "{ipaddr}/{cidr} | {ifname} ";
          "tooltip-format-disconnected"= "Disconnected";
          "on-click" = "kitty --execute nmtui";
        };


        "battery" = {
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
          "tooltip-format" = "{power}w | {timeTo}";
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth"= "{volume}% {icon}";
          "format-muted"= "";
          "format-icons"= {
              "alsa_output.pci-0000_00_1f.3.analog-stereo"= "";
              "alsa_output.pci-0000_00_1f.3.analog-stereo-muted"= "";
              "headphone"= "";
              "hands-free"= "";
              "headset"= "";
              "phone"= "";
              "phone-muted"= "";
              "portable"= "";
              "car"= "";
              "default"= ["" ""];
          };
          "on-click" = "pavucontrol";
        };

        "backlight" = {
          "device" = "intel_backlight";
          "format" = "L {percent}% {icon}";
          "format-icons" = ["" ""];
          "interval" = "2";
          "scroll-step" = "10.0";
          "tooltip" = "false";
        };

        "clock" = {
          "format" = "{:%A, %d. %B  %H:%M}";
          "timezone" = "Europe/Madrid";
          "tooltip-format" = "<tt>{calendar}</tt>";
          "calendar" = {
            "mode" = "year";
            "week-pos" = "right";
            "format" = {
                "months" =     "<span color='#ffead3'><b>{}</b></span>";
                "days"=       "<span color='#ecc6d9'><b>{}</b></span>";
                "weeks"=      "<span color='#99ffdd'><b>W{}</b></span>";
                "weekdays"=   "<span color='#ffcc66'><b>{}</b></span>";
                "today"=      "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
            "actions" = {
                    "on-click-right"= "mode";
                    "on-scroll-up"= "shift_up";
                    "on-scroll-down"= "shift_down";
            };
          };
        };

      };
    };
    style = with colors.gruvbox; ''
    * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 12px;
        border: none;
        border-radius: 0;
        box-shadow: none;
        text-shadow: none;
        transition-duration: 0s;
    }

    window#waybar {
        background-color: rgba(${rgb.bg},0.4);
        color: rgba(${rgb.fg},1);
    }


    '';

  };
}