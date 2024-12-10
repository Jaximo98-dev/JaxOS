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
    
    initExtra = ''

      if [ -n "''${commands[fzf-share]}" ]; then
        source "''$(fzf-share)/key-bindings.zsh"
        source "''$(fzf-share)/completion.zsh"
      fi

    '';

    shellAliases = shellAliases.shellAliases;

    # Oh my zsh!
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colored-man-pages" ];
      theme = "robbyrussell";
    };
  };


}