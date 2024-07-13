{ config, pkgs, ...}:
# https://github.com/HeinzDev/Hyprland-dotfiles/blob/main/home/programs/alacritty/default.nix https://github.com/MatthiasBenaets/nix-config/blob/master/modules/programs/alacritty.nix https://github.com/TwiggieSmallz/Default-Alacritty-TOML-Config/blob/main/alacritty.toml
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "none";
      font = {
        size = 11;
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };
      };
    };
  };
}