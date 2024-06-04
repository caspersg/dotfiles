return {
  "NeogitOrg/neogit",
  -- required for 0.9.5
  -- tag = "v0.0.1",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    require("neogit").setup({
      integrations = {
        telescope = true,
        diffview = true,
        fzf_lua = true,
      },
    })

    vim.keymap.set("n", "<leader>i", ":Neogit<CR>", { desc = "neog[i]t" })
  end,
}
