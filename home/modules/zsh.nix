{device, ...}:
let
  shellAliases = import ./shell_aliases.nix { inherit device; };
in
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    

    shellAliases = shellAliases.shellAliases;

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" ];
      theme = "robbyrussell";
    };
  };


}