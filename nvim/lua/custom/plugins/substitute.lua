return {
  "gbprod/substitute.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require("substitute").setup({})
    require("substitute").operator({
      count = 1, -- number of substitutions
      register = "a", -- register used for substitution
      -- it always waits as it's a leader
      -- motion = "iw", -- only available for `operator`, this will automatically use
      -- this motion for substitution instead of waiting for.
      modifiers = nil, -- this allows to modify substitued text, will override the default
      -- configuration (see below)
    })
    vim.keymap.set("n", "<leader>p", require("substitute").operator, { desc = "[p]aste substitue", noremap = true })
    vim.keymap.set("n", "<leader>pl", require("substitute").line, { desc = "[p]aste substitue [l]ine", noremap = true })
    vim.keymap.set("x", "<leader>p", require("substitute").visual, { desc = "[p]aste substitue", noremap = true })
  end,
}
