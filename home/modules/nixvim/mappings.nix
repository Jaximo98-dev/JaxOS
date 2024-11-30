{
  programs.nixvim.keymaps = [
    # Ex (netwr) file explorer navigation
    {
        mode = "n";
        key = "<leader>pv";
        action.__raw = "vim.cmd.Ex";
        options = {
          desc = "Open file explorer.";
        };
      }
  ];
}