{ config, pkgs, lib, device, ...}:
let
  # Define the modifier key
  modifier = config.xsession.windowManager.i3.config.modifier;
in
{
  xsession = {
    enable = true;
    initExtra = if(device == "desktop") then "xrandr --output DP-3 --mode 2560x1440 --rate 144" else "";
    windowManager.i3 = {
      enable = true;
      config = {

        bars = [];

        terminal = "alacritty";
        window.titlebar = false;
        window.border = 0;

      /*
          {command = "i3-msg 'workspace 1: console; exec alacritty -e 'tmux has-session -t wololo 2>/dev/null && tmux attach -t wololo || tmux new-session -s wololo'; for_window [instance=\"tmux\"] move to workspace 1'";}
          {command = "i3-msg 'workspace 2: web; exec firefox; for_window [class=\"Firefox\"] move to workspace 2'";}
          {command = "i3-msg 'workspace 3: obsidian; exec obsidian; for_window [class=\"Obsidian\"] move to workspace 3'";}

          {command = "i3-msg 'workspace 5: code; exec codium ~/JaxOS; for_window [class=\"VSCodium\"] move to workspace 5 '";}
          #{command = "i3-msg 'workspace 6: ds; exec discord; for_window [class=\"discord\"] move to workspace 6'";} 
      */
        startup = [
          {command = "systemctl --user restart polybar"; always = true; notification = false; }
          {command = "feh --bg-scale ~/JaxOS/wallpapers/gruv-ghibli.png"; always = true; notification = false; }
          
          {command = "alacritty -e zsh -c 'tmux has-session -t wololo 2>/dev/null && tmux attach -t wololo || tmux new-session -s wololo'";}
          {command = "firefox";}
          {command = "obsidian";}
          {command = "codium";}
          {command = "goland";}
          {command = "i3-msg workspace 1";}
        ];

        assigns = {
          "1" = [{ class = "^Alacritty$"; }];
          "2" = [{ class = "^firefox$"; instance = "Navigator"; }];
          "3" = [{ class = "^obsidian$"; instance = "obsidian"; }];
          "4" = [{ class = "^VSCodium$"; instance = "vscodium"; }];
          "5" = [{ class = "^jetbrains-goland$"; instance = "jetbrains-goland"; }];
          /*
          "1: console" = [ { class = "Alacritty"; } ];
          "2: web" = [ { class = "Firefox"; instance = "Firefox";} ];
          "3: obsidian" = [ { class = "Obsidian"; instance = "Obsidian";} ]; 
          
          "5: code" = [ { class = "VSCodium"; } ]; 
          "6: discord" = [ { class = "discord"; instance = "discord"; } ];
          */
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
