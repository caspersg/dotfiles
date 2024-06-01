return { -- Autoformat
  "fnune/recall.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("recall").setup({
      sign = "",
      sign_highlight = "@comment.note",

      telescope = {
        autoload = true,
        mappings = {
          unmark_selected_entry = {
            normal = "dd",
            insert = "<M-d>",
          },
        },
      },

      wshada = vim.fn.has("nvim-0.10") == 0,
    })

    local recall = require("recall")

    vim.keymap.set("n", "<leader>mm", recall.toggle, { desc = "[m]ark toggle" })
    vim.keymap.set("n", "<leader>mn", recall.goto_next, { desc = "[m]ark [n]ext" })
    vim.keymap.set("n", "<leader>mp", recall.goto_prev, { desc = "[m]ark [p]revious" })
    vim.keymap.set("n", "<leader>ml", ":Telescope recall<CR>", { desc = "[m]ark [l]ist" })
  end,
}
