{

  imports = [
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";

    /*# Performance
    performance = {
      byteCompileLua.enable = true;
      combinePlugins.enable = true;
    };*/
  };
}

