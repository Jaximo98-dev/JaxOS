{ config, pkgs, lib, ...}:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    #extraLuaConfig = builtins.readFile(./nvim/init.lua);
  };

  xdg.configFile = {
  "nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/JaxOS/home/modules/nvim";
  };
};

}