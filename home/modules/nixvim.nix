{

  # Reference: https://github.com/JMartJonesy/kickstart.nixvim/

  imports = [
    ./nixvim/mappings.nix
    # Files
    ./nixvim/telescope.nix
    ./nixvim/treesitter.nix
    ./nixvim/neo-tree.nix

    # LSP and similar
    ./nixvim/conform.nix # No quiere funcionar pero es interesante
    ./nixvim/nvim-cmp.nix
    ./nixvim/lsp.nix

    # Misc
    ./nixvim/mini.nix
    ./nixvim/gitsigns.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = {
      # Adds icons for plugins to utilize in ui
      web-devicons.enable = true;

      # Detect tabstop and shiftwidth automatically
      # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
      sleuth.enable = true;

      # Give information about possible keymaps
      which-key.enable = true;

      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments.enable = true;

      # Inserts matching pairs of parens, brackets, etc.
      # https://nix-community.github.io/nixvim/plugins/nvim-autopairs/index.html
      nvim-autopairs.enable = true;

      # Add indentation guides even on blank lines. For configuration see `:help ibl`
      # https://nix-community.github.io/nixvim/plugins/indent-blankline/index.html
      indent-blankline.enable = true;

      harpoon.enable = true;

      # Vim training
      vim-be-good.enable = true;
      hardtime.enable = true;
      precognition.enable = true;
    };

    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = true;
    };

    # [[ Setting options ]]
    # See `:help vim.opt`
    # NOTE: You can change these options as you wish!
    #  For more options, you can see `:help option-list`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#opts
    opts = {
      # Show line numbers
      number = true;
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      #relativenumber = true

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the statusline
      showmode = false;

      #  See `:help 'clipboard'`
      clipboard = {
        providers = {
          wl-copy.enable = true; # For Wayland
          wl-paste.enable = true;
        };

        # Sync clipboard between OS and Neovim
        #  Remove this option if you want your OS clipboard to remain independent.
        register = "unnamedplus";
      };

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  See `:help 'listchars'`
      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview subsitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # See `:help hlsearch`
      hlsearch = true;
    };



    # TODO: Figure out where to move this
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
    /*extraConfigLuaPre = ''
      if vim.g.have_nerd_font then
        require('nvim-web-devicons').setup {}
      end
    '';*/

    # The line beneath this is called `modeline`. See `:help modeline`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
    extraConfigLuaPost = ''
      -- vim: ts=2 sts=2 sw=2 et
    '';

  };
}

