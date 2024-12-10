{lib, pkgs, username, device, ... }:{

  imports = 
  [
    #ARCHIVED: ./modules/xsession.nix      # Initial xsession
    #ARCHIVED: ./modules/alacritty.nix     # Terminal emulator
    #ARCHIVED:./modules/wezterm.nix
    #ARCHIVED: ./modules/tmux.nix          # Session manager
    #ARCHIVED: ./modules/neovim.nix        # code editor 1
    #ARCHIVED: ./modules/polybar.nix       # bar


    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/kitty.nix

    ./modules/zsh.nix           # Shell interpreter
    ./modules/shell_tools.nix
    ./modules/git.nix           # git
    ./modules/btop.nix          # Performance monitor

    ./modules/rofi.nix
    ./modules/firefox.nix       # firefoxt
    ./modules/nixvim.nix

  ];

  home = {
    username = username;

    packages = with pkgs; [
      # Fundamentales/Cimientos
      home-manager
      gnumake
      bat

      tree
      yazi
      tealdeer
      ncdu
      brightnessctl   # Keyboad backlight for laptop
      pavucontrol
      

      #LSP and Compilares and Languages
      nil
      clang
      go
      jetbrains.jdk # Java modificado para usar sus IDEs mejor...
      maven
      python3
      
      # Editors
      vscodium
      jetbrains.goland
      #jetbrains.clion
      jetbrains.idea-ultimate

      # Apps
      vlc
      obsidian

      # Discord
      vesktop
      xwaylandvideobridge # Screenshare fix on x11 windows
      wireplumber # Screenshare audio
      
    ];

    stateVersion = "24.05";
  };
}
