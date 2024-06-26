{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;

    # Zsh settings
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      rof = "rofi -show drun; exit";
      cdj = "cd ~/JaxOS";
      cdjm = "cd ~/JaxOS; make";
    };

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };
}