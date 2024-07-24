{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    

    shellAliases = {
      ll = "ls -l";
      rof = "rofi -show drun; exit";
      cdj = "cd ~/JaxOS";
      cdjmd = "cd ~/JaxOS; make desktop";
      cdjml = "cd ~/JaxOS; make laptop";
      
      pn = "cd ~/JaxOS/home/modules/nvim";
      pa = "cd ~/Documentos/proyectos/abyssmmo";
    };

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "colored-man-pages" ];
      theme = "robbyrussell";
    };
  };


}