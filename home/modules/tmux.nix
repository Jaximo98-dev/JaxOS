{ config, pkgs, ...}:

{
  programs.tmux = {
    enable = true;

    #shell = "\${pkgs.zsh}/bin/zsh";
    #keyMode = "vi";
    #clock24 = true;
    #historyLimit = 5000;
  };
}