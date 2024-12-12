{ config, pkgs, ...}:
{
  programs.navi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      cheats.paths = [ "$JAXOS/cheatsheets" ];
      client.tealdeer = true;
      shell.command = "zsh";
  };
 };
}