{ config, pkgs, ...}:

{
  programs.alacritty.enable = true;

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
    };

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };
}