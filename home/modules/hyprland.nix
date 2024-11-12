{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      /*general = {
        gaps_in = 2;
        gaps_out = 3;
      };*/

      terminal = "wezterm";

      misc = {
        disable_hyprland_logo = true;
      };

      /*
      decoration = {
        rounding = 2;
      };

      animations = {
        enabled = false;
      };

      input = {};

        kb_options = "ctrl:nocaps";
      }; */

      "$mod" = "SUPER";

      bind = [
        "$mod, Q, exec, wezterm"
        "$mod, F, exec, firefox"
        "$mod, D, exec, discord"
        "$mod, R, exec, rofi"

        "$mod, W, killactive"

        "$mod, M, exit"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

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
    };
  };
}