{ device, ... }:

{
  shellAliases = {
    rof = "rofi -show drun; exit";
    cdj = "cd ~/JaxOS";
    cdjmd = if (device == "desktop") then "cd ~/JaxOS; make desktop" else "echo Este es el portátil, zopenco.";
    cdjml = if (device == "laptop") then "cd ~/JaxOS; make laptop" else "echo Este es el sobremesa, tifón.";

    # --- custom ---
    # Pulls the weather
    weather = "curl https://wttr.in/Malaga";

    # --- fzf ---
    f = "fzf";
    # Use fzf to search all man pages
    fman = "compgen -c | fzf | xargs man";

    # --- eza ---
    ls = "eza -a --long --sort=name --group-directories-first --icons --header --git-ignore";
    lr = "eza -a -R --long --sort=name --group-directories-first --icons --header --git-ignore";

  };
}
