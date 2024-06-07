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
          {command = "firefox";}
        ];

      };
    };

  };

}