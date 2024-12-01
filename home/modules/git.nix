{ config, pkgs, ...}:

{
  programs.lazygit.enable = true;
  programs.git = {
    enable = true;
    userName  = "Jaximo98";
    userEmail = "jaximo98dev@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
  };
}