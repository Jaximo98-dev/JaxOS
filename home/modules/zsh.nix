{device, ...}:

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
      cdjmd = if(device == "desktop") then "cd ~/JaxOS; make desktop" else "echo Este es el portatil, zopenco.";
      cdjml = if(device == "laptop") then "cd ~/JaxOS; make laptop" else "echo Este es el sobremesa, tifon.";
      
      pn = "cd ~/JaxOS/home/modules/nvim";
      pa = "cd ~/Documentos/proyectos/abyssmmo";

      # Custom functions
      tiempo = "curl https://wttr.in/Malaga";
      weather = "curl https://wttr.in/Malaga";
    };

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" ];
      theme = "robbyrussell";
    };
  };


}