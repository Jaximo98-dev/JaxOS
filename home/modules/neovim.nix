{ config, pkgs, lib, ...}:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];

    #extraLuaConfig = builtins.readFile(./nvim/init.lua);
  };


  # Clean all nvim config with  rm -rf ~/.local/state/nvim and  rm -rf ~/.local/share/nvim
  xdg.configFile = {
  "nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/JaxOS/home/modules/nvim";#"${config.home.homeDirectory}/JaxOS/home/modules/nvim";
    recursive = true;
  };
};

}