#
# Configuration of the display server, Wayland. ANd the Display Manager alike.
# DOCS: https://www.drakerossman.com/blog/wayland-on-nixos-confusion-conquest-triumph https://www.youtube.com/watch?v=61wGzIv12Ds
{ config, pkgs, lib, device, ... }:
{
  #  --- x11 - i3 - lightdm --- 
  /*
  # Xsession.nix & polybar.nix archived.
  environment.pathsToLink = ["/libexec"];
  services.xserver = {
    enable = false;
    displayManager.lightdm = {
      enable = false;
      greeters.mini = {
            enable = true;
            user = "jaximo";
            extraConfig = ''
                [greeter]
                # The user to login as.
                user = jaximo

                # Whether to show the password input's label.
                show-password-label = true

                # The text of the password input's label.
                password-label-text = password:

                # The text shown when an invalid password is entered. May be blank.
                invalid-password-text = Invalid Password

                # Show a blinking cursor in the password input.
                show-input-cursor = true

                # The text alignment for the password input. Possible values are:
                # "left", "center", or "right"
                password-alignment = right

                # The number of characters that should fit into the password input.
                # A value of -1 will use GTK's default width.
                # Note: The entered width is a suggestion, GTK may render a narrower input.
                password-input-width = -1

                # Show the background image on all monitors or just the primary monitor.
                show-image-on-all-monitors = true
                
                # Show system info above the password input.
                # `<user>@<hostname>` is shown on the left side, & current time on the right.
                show-sys-info = true


                [greeter-hotkeys]
                # The modifier key used to trigger hotkeys. Possible values are:
                # "alt", "control" or "meta"
                # meta is also known as the "Windows"/"Super" key
                mod-key = meta
                # Power management shortcuts (single-key, case-sensitive)
                shutdown-key = s
                restart-key = r
                hibernate-key = h
                suspend-key = u
                # Cycle through available sessions
                session-key = e

                [greeter-theme]
                # A color from X11's `rgb.txt` file, a quoted hex string(`"#rrggbb"`) or a
                # RGB color(`rgb(r,g,b)`) are all acceptable formats.

                # The font to use for all text
                font = "JetBrainsMono Nerd Font"

                # The font size to use for all text
                font-size = 1em

                # The font weight to use for all text
                font-weight = bold

                # The font style to use for all text
                font-style = normal

                # The default text color
                text-color = "#080800"

                # The color of the error text
                error-color = "#98971A"

                # An absolute path to an optional background image.
                # Note: The file should be somewhere that LightDM has permissions to read
                #       (e.g., /etc/lightdm/).
                background-image = "/home/jaximo/JaxOS/wallpapers/gruv-painting.jpg"

                # Background image size:
                # auto: unscaled
                # cover: scale image to fill screen space
                # contain: scale image to fit inside screen space
                # (more options: https://www.w3.org/TR/css-backgrounds-3/#background-size)
                background-image-size = auto

                # The screen's background color.
                background-color = "#282828"

                # The password window's background color
                window-color = "#B8BB26"

                # The color of the password window's border
                border-color = "#282828"

                # The width of the password window's border.
                # A trailing `px` is required.
                border-width = 2px

                # The pixels of empty space around the password input.
                # Do not include a trailing `px`.
                layout-space = 15

                # The character used to mask your password. Possible values are:
                # "-1", "0", or a single unicode character(including emojis)
                # A value of -1 uses the default bullet & 0 displays no characters when you
                # type your password.
                password-character = -1

                # The color of the text in the password input.
                password-color = "#EBDBB2"

                # The background color of the password input.
                password-background-color = "#282828"

                # The color of the password input's border.
                # Falls back to `border-color` if missing.
                password-border-color = "#282828"

                # The width of the password input's border.
                # Falls back to `border-width` if missing.
                password-border-width = 2px

                # The border radius of the password input.
                #password-border-radius = 0.341125em


                # Override font for system info
                # Falls back to `font` if missing.
                sys-info-font = "Mono"
                # Set font size of system info
                # Falls back to `font-size` if missing.
                sys-info-font-size = 0.8em
                # Override color for system info text
                # Falls back to `text-color` if missing.
                #sys-info-color = "#080800"
                # Margins around the system info section
                # The default `-5px -5px -5px` works well with the password label enabled.
                # If you have the label disabled, you might want to try `-5px -5px 0px`
                sys-info-margin = -5px -5px -5px
            '';
        };
      };
    windowManager.i3 = {
      enable = false;
    };
    # Graphics fix?
    videoDrivers = lib.mkIf (device == "laptop") [ "modesetting" ];
    defaultSession = "none+i3";
  };

  # Composer
  services.picom.enable = true;
  services.picom.vSync = true;
  services.picom.shadow = false; 
  */

  #  --- WAYLAND - HYPRLAND --- 
  hardware.opengl.enable = true; # Para que no de errores wayland
  security.polkit.enable = true; # Para permisos granulados entre procesos no priv to priv

  environment.systemPackages = with pkgs; [
    # Bare requirements
    hyprland # Compositor
    xwayland # Run X11 apps in Wayland
    greetd.tuigreet


    # Nice stuff
    mako # Notifications
    libnotify # mako dependency

    waybar
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Wayland fix for electron apps.

#        --user-menu \        
  services.greetd = {
    enable = true;
    settings = {

    
     default_session = {
      command = ''
      ${pkgs.greetd.tuigreet}/bin/tuigreet \
        --time \
        --remember \
        --remember-session \
        --asterisks \
        --sessions "${pkgs.hyprland}/share/wayland-sessions" \
        --theme "border=gray;text=darkgray;prompt=lightgreen;time=gray;action=lightgreen;button=gray;container=darkgray;input=white" \
        --cmd hyprland
      '';
     };
     user = "greeter";

    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };


  # Las opciones en la barra de seleccion
  environment.etc."greetd/environments".text = ''
    hyprland
  '';

  # Permisos
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
}
