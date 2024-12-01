{pkgs, device, ...}:
{

  home.packages = with pkgs; [
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {

      #monitor = name, resolution, position, scale
      #monitor = DP-1, 1920x1080@144, 0x0, 1
      # --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-features=WaylandFractionalScaleV1
      # https://wiki.hyprland.org/Configuring/Monitors/
      monitor = if device == "laptop" then [
        ",preferred,auto,1"
        ",preferred,auto-up,1"
      ] else [
        "DP-3,preferred,auto,1"
        "HDMI-A-1,preferred,auto-left,1,transform,3"
      ];

      general = {
        layout = "dwindle";

        gaps_in = 2;
        gaps_out = 0;
        resize_on_border = true;
        "col.inactive_border" = "rgba(282828ff)";
        "col.active_border" = "rgba(32302fff)";
      };

      xwayland = {
          force_zero_scaling = true;
        };

      misc = {
        vfr = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      
      # Looks


      decoration = {
        rounding = 0;
      };

      
      animations = {
        enabled = true;
        bezier = "easeOutExpo, 0.16, 1, 0.3, 1";

        animation = [
          "windows, 0"
          "windowsOut, 1, 7, default, popin 80%"
          "workspaces, 1, 6, default"
        ];
      };

      # Function

      input = {
        kb_layout = "es";
      };

      "$mod" = "SUPER";

      windowrulev2 = [
        "workspace 1, class:^(firefox)$"
        "workspace 2, class:^(kitty)$"
        "workspace 3, class:^(codium-url-handler)$"
      ];

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, D, exec, vesktop"
        "$mod, C, exec, codium"
        "$mod, R, exec, rofi -show drun"

        "$mod, W, killactive"

        "$mod, M, exit"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"


        "$mod, V, togglefloating,"
        "$mod, SPACE, fullscreen"
      ];

      exec-once = [
      ''
        swww init && swww img "$(find ~/JaxOS/themes/wallpapers -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)"
      ''
      "waybar"
      "bus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" # Screenshare

      # Apps
      "firefox"
      "kitty"
      "codium"
      ];
    };
  };
}