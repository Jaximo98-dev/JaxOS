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

/*
dark0_hard = rgba(1d2021ff);   /* #1d2021 - 29-32-33 
dark0      = rgba(282828ff);   /* #282828 - 40-40-40 
dark0_soft = rgba(32302fff);   /* #32302f - 50-48-47 
dark1      = rgba(3c3836ff);   /* #3c3836 - 60-56-54 
dark2      = rgba(504945ff);   /* #504945 - 80-73-69 
dark3      = rgba(665c54ff);   /* #665c54 - 102-92-84
dark4      = rgba(7c6f64ff);   /* #7c6f64 - 124-111-100 
dark4_256  = rgba(7c6f64ff);   /* #7c6f64 - 124-111-100 

gray_245   = rgba(928374ff);   /* #928374 - 146-131-116 
gray_244   = rgba(928374ff);   /* #928374 - 146-131-116 

light0_hard = rgba(f9f5d7ff);  /* #f9f5d7 - 249-245-215 
light0      = rgba(fbf1c7ff);  /* #fbf1c7 - 253-244-193 
light0_soft = rgba(f2e5bcff);  /* #f2e5bc - 242-229-188 
light1      = rgba(ebdbb2ff);  /* #ebdbb2 - 235-219-178 
light2      = rgba(d5c4a1ff);  /* #d5c4a1 - 213-196-161 
light3      = rgba(bdae93ff);  /* #bdae93 - 189-174-147 
light4      = rgba(a89984ff);  /* #a89984 - 168-153-132 
light4_256  = rgba(a89984ff);  /* #a89984 - 168-153-132 

bright_red    = rgba(fb4934ff);  /* #fb4934 - 251-73-52 
bright_green  = rgba(b8bb26ff);  /* #b8bb26 - 184-187-38 
bright_yellow = rgba(fabd2fff);  /* #fabd2f - 250-189-47 
bright_blue   = rgba(83a598ff);  /* #83a598 - 131-165-152 
bright_purple = rgba(d3869bff);  /* #d3869b - 211-134-155 
bright_aqua   = rgba(8ec07cff);  /* #8ec07c - 142-192-124 
bright_orange = rgba(fe8019ff);  /* #fe8019 - 254-128-25 

neutral_red    = rgba(cc241dff); /* #cc241d - 204-36-29 
neutral_green  = rgba(98971aff); /* #98971a - 152-151-26 
neutral_yellow = rgba(d79921ff); /* #d79921 - 215-153-33 
neutral_blue   = rgba(458588ff); /* #458588 - 69-133-136 
neutral_purple = rgba(b16286ff); /* #b16286 - 177-98-134 
neutral_aqua   = rgba(689d6aff); /* #689d6a - 104-157-106 
neutral_orange = rgba(d65d0eff); /* #d65d0e - 214-93-14 

faded_red      = rgba(9d0006ff); /* #9d0006 - 157-0-6 
faded_green    = rgba(79740eff); /* #79740e - 121-116-14 
faded_yellow   = rgba(b57614ff); /* #b57614 - 181-118-20 
faded_blue     = rgba(076678ff); /* #076678 - 7-102-120 
faded_purple   = rgba(8f3f71ff); /* #8f3f71 - 143-63-113 
faded_aqua     = rgba(427b58ff); /* #427b58 - 66-123-88 
faded_orange   = rgba(af3a03ff); /* #af3a03 - 175-58-3 
*/

      general = {
        layout = "dwindle";

        gaps_in = 2;
        gaps_out = 2;
        resize_on_border = true;
        "col.inactive_border" = "rgba(282828ff)";
        "col.active_border" = "rgba(928374ff)";
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
        rounding = 0;
      };

      
      animations = {
        enabled = true;
        bezier = "easeOutExpo, 0.16, 1, 0.3, 1";

        animation = [
          "windows, 1, 7, easeOutExpo"
          "windowsOut, 1, 7, default, popin 80%"
          "workspaces, 1, 6, default"
        ];
      };

      input = {
        kb_layout = "es";
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
      ];
    };
  };
}