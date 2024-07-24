  
  # JaxOS
  This repository contains my full NixOS setup. Heavily inspired in the philosophy of reducing the amount of mental gimmicks to get to places and doing so with the most comfortable and joyful experience. I shall rice this shit to the brim, simplicity and function over form.
  
  ## Installation
  1. Get an instance of NixOS ISO running, and install the whatever template.
  2. Secure internet connection and then git clone the repo, ./dotfiles preferably.
  3. Open terminal, run `nix-shell -p gnumake` and then move to repo directory.
  4. Run `make desktop` or `make laptop`

  ## Todo
  - [ ] Add one generic profile, that does not use preset hardware configuration files.
  - [ ] Fingerprint for laptop
  - [ ] Secrets
  - [ ] Multi monitor fix
  - [ ] Rice using nix-style

  - [x] Alacritty configuration
  - [ ] Tmux configuration
  - [x] Polybar configuration
  - [X] Neovim configuration
  - [x] Firefox configuration
  - [ ] Spotify configuration
  - [X] Obsidian configuration with sync
  - [ ] Remove arrows as movement, change capslock.

  ---
  sers.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  *Por si se abre el TTY, se queda igual*
  programs.bash.shellAliases = {
    la = "ls -a";
    ls = "ls -l";
    update = "sudo nixos-rebuild switch";
    rof = "rofi -show drun";
  };


  xrandr --output DP-3 --mode 2560x1440 --rate 144
