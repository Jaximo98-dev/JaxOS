{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName  = "Jaximo98-dev";
    userEmail = "jaximo98dev@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
  };
}