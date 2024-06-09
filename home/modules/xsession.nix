{ config, pkgs, lib, ...}:
let
  # Define the modifier key
  modifier = config.xsession.windowManager.i3.config.modifier;
in
{
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {

        terminal = "alacritty";
        window.titlebar = false;

        startup = [
          {command = "i3-msg 'workspace 1: web; exec firefox; for_window [class=\"Firefox\"] focus'";}
          {command = "i3-msg 'workspace 2: code; exec codium ~/JaxOS'";}     
          {command = "i3-msg 'workspace 3: tmux; exec alacritty -e tmux'";}
          {command = "i3-msg 'workspace 5: ds; exec discord'";}  
        ];

        assigns = {
          "1: web" = [ { class = "Firefox"; } ];
          "2: code" = [ { class = "VSCodium"; } ]; 
          "3: tmux" = [ { class = "Alacritty"; instance = "tmux"; } ];
          "5: ds" = [ { class = "Discord";} ];
        };
        
        keybindings = lib.mkOptionDefault {
          "${modifier}+Return" = "exec alacritty";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi";
        };

      };
    };

  };

}
