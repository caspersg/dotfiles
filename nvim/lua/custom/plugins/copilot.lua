return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
  -- "github/copilot.vim",
  -- config = function()
  --   -- require("copilot").setup({})
  --   -- vim.keymap.set("n", "<leader>g", "<cmd>Copilot<CR>", { desc = "Copilot" })
  --
  --   -- replace tab with another option
  --   -- TODO: pick another key binding
  --   vim.keymap.set("i", "<C-Space>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
  --   vim.g.copilot_no_tab_map = true
  -- end,
}
