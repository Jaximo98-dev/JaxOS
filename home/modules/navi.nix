{ config, pkgs, ...}:
{
  programs.navi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      cheats.path = [ "$JAXOS/cheatsheets" ];
      client.tealdeer = true;
      shell.command = "zsh";
  };
 };
}