  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Por si se abre el TTY, se queda igual
  programs.bash.shellAliases = {
    la = "ls -a";
    ls = "ls -l";
    update = "sudo nixos-rebuild switch";
    rof = "rofi -show drun";
  };