{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = ["backlight" "network" "battery" "pulseaudio" "tray" ];

        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{percent}%";
        };

      };
    };
  };
}