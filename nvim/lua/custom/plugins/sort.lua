return {
  "sQVe/sort.nvim",
  config = function()
    require("sort").setup({})
    vim.keymap.set("n", "gs", "<Cmd>Sort<CR>", { desc = "[g]o [s]ort" })
    vim.keymap.set("v", "gs", "<Esc><Cmd>Sort<CR>", { desc = "[g]o [s]ort" })
  end,
}
