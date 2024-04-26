return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("spectre").setup({})
    vim.keymap.set(
      "n",
      "<leader>sr",
      '<cmd>lua require("spectre").toggle()<CR>',
      { desc = "[s]earch [r]eplace Toggle Spectre" }
    )
    vim.keymap.set("v", "<leader>sv", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = "[s]earch [v]isual current word",
    })
    vim.keymap.set("n", "<leader>sc", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = "[s]earch on [c]urrent file",
    })
  end,
}
