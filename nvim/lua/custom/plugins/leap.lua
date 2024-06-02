return {
  "ggandor/leap.nvim",
  config = function()
    require("leap").setup({})
    vim.keymap.set({ "n", "x", "o" }, "gl", "<Plug>(leap-forward)", { desc = "[g]o [l]eap forward" })
    vim.keymap.set({ "n", "x", "o" }, "gL", "<Plug>(leap-backward)", { desc = "[g]o [l]eap backward" })
    -- vim.keymap.set({ "n", "x", "o" }, "gS", "<Plug>(leap-from-window)", { desc = "[g]o [l]eap from window" })
  end,
}
