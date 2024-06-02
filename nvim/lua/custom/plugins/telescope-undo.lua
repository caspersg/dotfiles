return {
  "debugloop/telescope-undo.nvim",
  config = function()
    vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "[s]earch [u]ndo" })
  end,
}
