{
  programs.nixvim.keymaps = [
    # Ex (netwr) file explorer navigation
    {
        mode = "n";
        key = "<leader>pv";
        action = "Ex";
        options = {
          desc = "Open file explorer.";
        };
      }
  ];
}