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
        ",preferred,auto,1"
        ",preferred,auto-left,1"
      ];

      general = {
        gaps_in = 1;
        gaps_out = 1;
      };

      xwayland = {
          force_zero_scaling = true;
        };

      misc = {
        vfr = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      
      decoration = {
        rounding = 10;
      };

      /*
      animations = {
        enabled = false;
      };*/

      input = {
        kb_layout = "es";
        #kb_variant = "qwerty";
        #kb_options = "ctrl:nocaps";
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, D, exec, vesktop"
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
      ];

      exec-once = [
      ''
        swww init && swww img "$(find ~/JaxOS/wallpapers/ -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)"
      ''
      "waybar"
      ];
    };
  };
}