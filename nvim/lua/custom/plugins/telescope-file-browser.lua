return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "<leader>sF", ":Telescope file_browser<CR>", { desc = "[s]earch [F]ile browser" })
  end,
}
