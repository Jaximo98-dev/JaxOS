{ config, pkgs, ...}:
# https://github.com/HeinzDev/Hyprland-dotfiles/blob/main/home/programs/alacritty/default.nix https://github.com/MatthiasBenaets/nix-config/blob/master/modules/programs/alacritty.nix https://github.com/TwiggieSmallz/Default-Alacritty-TOML-Config/blob/main/alacritty.toml
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;
    };
  };
}