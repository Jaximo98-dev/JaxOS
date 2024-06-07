{ config, pkgs, ...}:

{
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {

        terminal = "alacritty";
        window.titlebar = false;

        startup = [
          {command = "i3-msg 'workspace 1: web; exec firefox'";}
          {command = "i3-msg 'workspace 2: code; exec codium ~/JaxOS'";}     
          {command = "i3-msg 'workspace 3: tmux; exec tmux'";}
          {command = "i3-msg 'workspace 5: ds; exec discord'";}  
        ];

        assigns = {
          "1: web" = [ { class = "^Firefox$"; } ];
          "2: code" = [ { class = "^VSCodium$"; } ]; 
          "3: tmux" = [ { class = "^Tmux$"; } ];
          "5: ds" = [ { class = "^Discord$"; } ];
      };

      };
    };

  };

}