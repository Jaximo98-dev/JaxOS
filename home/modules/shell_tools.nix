{config, ...}:
{

  # File fuzzy finder. CTRL + T.
  programs.fzf = {
    enable = true;
    colors = {
        fg = "#ebdbb2";
        bg = "-1";
        hl = "#fabd2f";
        info = "#83a598";
        prompt = "#bdae93";
        spinner = "#fabd2f";
        pointer = "#83a598";
        marker = "#fe8019";
        header = "#665c54";
    };
  };

  # Better cat command
  programs.bat.enable = true;

  # Better ls command
  programs.eza = {
    enable = true;
  };
  home.file."${config.xdg.configHome}/eza/theme.yml" = {
    source = ../../themes/gruvbox_dark_eza.yml;
  };

  # Git in CLI
  programs.lazygit.enable = true;

  # History-aware cd command 
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [];
  };

  # System monitor
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark";
      theme_background = false;
    };
  };

}