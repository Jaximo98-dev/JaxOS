{ config, pkgs, lib, ...}:
let
  # Define the modifier key
  modifier = config.xsession.windowManager.i3.config.modifier;
in
{
  xsession = {
    enable = true;
    initExtra = " xrandr --output DP-3 --mode 2560x1440 --rate 144"; #TODO portatil
    windowManager.i3 = {
      enable = true;
      config = {

        terminal = "alacritty";
        window.titlebar = false;

        startup = [
          {command = "i3-msg 'workspace 1: web; exec firefox; for_window [class=\"Firefox\"] move to workspace 1'";}
          {command = "i3-msg 'workspace 2: code; exec codium ~/JaxOS;for_window [class=\"VSCodium\"] move to workspace 2 '";}     
          {command = "i3-msg 'workspace 5: ds; exec discord; for_window [class=\"discord\"] move to workspace 5'";} 
          {command = "i3-msg 'workspace 3: console; exec alacritty -e tmux; for_window [instance=\"tmux\"] move to workspace 3'";}
        ];

        assigns = {
          "1: web" = [ { class = "Firefox"; } ];
          "2: code" = [ { class = "VSCodium"; } ]; 
          "3: console" = [ { class = "Alacritty"; } ];
          "5: ds" = [ { class = "discord"; instance = "discord"; } ];
        };
        
        keybindings = lib.mkOptionDefault {
          "${modifier}+Return" = "exec alacritty";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";
          #"button7" = "workspace prev"; # Rueda raton izq
          #"button6" = "workspace next"; # Rueda raton der
        };

      };
    };

  };

}
