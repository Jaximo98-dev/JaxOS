{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName  = "Jaximo98-dev";
    userEmail = "jaximo98dev@gmail.com";
  };

  programs.gh = {
    enable = true;
  };
}