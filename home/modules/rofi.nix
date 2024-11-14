{pkgs, ...}:
{
  programs.rofi-wayland = {
    enable = true;
    theme = "gruvbox-dark";
    font = "JetBrainsMono Nerd Font";
    terminal = "${pkgs.kitty}/bin/kitty";
    
    plugins = with pkgs; [
      rofi-calc
      rofi-obsidian
    ];
  };
}