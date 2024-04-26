return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      size = 40,
      start_in_insert = true,
      open_mapping = [[<c-\>]],
      insert_mappings = true,
      terminal_mappings = true,
    })
    -- vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm, { desc = "[t]erminal [t]erm" })
    -- vim.keymap.set("n", "<leader>tt", vim.cmd.ToggleTerm, { desc = "[t]erminals [t]oggle" })
  end,
}
