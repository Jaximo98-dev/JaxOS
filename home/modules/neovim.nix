{ config, pkgs, lib, ...}:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    #extraLuaConfig = builtins.readFile(./nvim/init.lua);
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/JaxOS/home/modules/nvim";
}