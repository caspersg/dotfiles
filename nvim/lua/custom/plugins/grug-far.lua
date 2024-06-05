return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      windowCreationCommand = "tabnew",
    })

    vim.keymap.set("n", "<leader>sr", function()
      require("grug-far").grug_far({})
    end, { desc = "[s]earch [r]eplace" })

    vim.keymap.set("v", "<leader>sv", function()
      require("grug-far").with_visual_selection({})
    end, {
      desc = "[s]earch [v]isual current word",
    })

    vim.keymap.set("n", "<leader>sc", function()
      require("grug-far").grug_far({ prefills = { flags = vim.fn.expand("%") } })
    end, {
      desc = "[s]earch in [c]urrent file",
    })
  end,
}
