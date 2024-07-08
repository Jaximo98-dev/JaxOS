{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      rof = "rofi -show drun; exit";
      cdj = "cd ~/JaxOS";
      cdjmd = "cd ~/JaxOS; make desktop";
      cdjml = "cd ~/JaxOS; make laptop";
    };

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}