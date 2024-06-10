{ config, pkgs, ...}:

{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";
    historyLimit = 100000;
    keyMode = "vi";
    prefix = "C-a";
    baseIndex = 1;
    sensibleOnTop = true;
    mouse = true;

    # Sacado de https://gitlab.com/hmajid2301/dotfiles/-/blob/06bf4ad267beb6693b941ef51d880e4d0fc1df0a/home-manager/programs/multiplexers/tmux.nix
    plugins = with pkgs.tmuxPlugins; [
      yank
      tmux-thumbs
      {
        plugin = mkTmuxPlugin {
          pluginName = "tmux.nvim";
          version = "unstable-2023-01-06";
          src = pkgs.fetchFromGitHub {
            owner = "aserowy";
            repo = "tmux.nvim";
            rev = "57220071739c723c3a318e9d529d3e5045f503b8";
            sha256 = "sha256-zpg7XJky7PRa5sC7sPRsU2ZOjj0wcepITLAelPjEkSI=";
          };
        };
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'

          # Taken from: https://github.com/p3t33/nixos_flake/blob/5a989e5af403b4efe296be6f39ffe6d5d440d6d6/home/modules/tmux.nix
          resurrect_dir="$HOME/.tmux/resurrect"
          set -g @resurrect-dir $resurrect_dir
          set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
          set -g @continuum-systemd-start-cmd 'start-server'
        '';
      }
    ];

  };
}