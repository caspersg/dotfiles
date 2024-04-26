return {
  "debugloop/telescope-undo.nvim",
  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "telescope [u]ndo" })
  end,
}
