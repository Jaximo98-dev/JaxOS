{ pkgs, ...}:
{
  home-manager.sharedModules = [{
    stylix.targets.xyz.enable = false;
  }];

  stylix.enable = true;
  stylix.image = ../stylix/gruv-greek.png;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
}