  
  # JaxOS
  This repository contains my full NixOS setup. Heavily inspired in the philosophy of reducing the amount of mental gimmicks to get to places and doing so with the most comfortable and joyful experience. I shall rice this shit to the brim, simplicity and function over form.
  
  ---
  sers.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  ### Por si se abre el TTY, se queda igual
  programs.bash.shellAliases = {
    la = "ls -a";
    ls = "ls -l";
    update = "sudo nixos-rebuild switch";
    rof = "rofi -show drun";
  };


  xrandr --output DP-3 --mode 2560x1440 --rate 144
