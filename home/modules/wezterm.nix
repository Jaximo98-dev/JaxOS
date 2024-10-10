{ config, pkgs, ...}:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      -- Pull in the wezterm API
      local wezterm = require 'wezterm'
      
      -- This table will hold the configuration.
      local config = {}
      
      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.scrollback_lines = 10000
      config.enable_tab_bar = true
      config.use_fancy_tab_bar = false
      config.hide_tab_bar_if_only_one_tab = true


      config.color_scheme = 'Gruvbox Dark (Gogh)'
      config.font = wezterm.font_with_fallback{
        'JetBrainsMono Nerd Font',
        'JetBrainsMono',
        'Fira Code',
      }
      config.font_size=11
      config.window_padding = { left = 2, right = 2, top = 2, bottom = 2, }
      config.window_background_opacity = 0.9

      config.visual_bell = {
        fade_in_duration_ms = 75,
        fade_out_duration_ms = 75,
        target = 'CursorColor',
      }
      config.color = {
        visual_bell = '#83A598',
      }

      config.animation_fps = 144
      config.max_fps = 144
      config.front_end = 'WebGpu'
      config.window_decorations = "RESIZE"
      config.window_close_confirmation = 'NeverPrompt'

      config.check_for_updates = false

      config.unix_domains = {{name = 'unix',},}
      config.default_gui_startup_args = { 'connect', 'unix' }


      return config
    '';
  };

}