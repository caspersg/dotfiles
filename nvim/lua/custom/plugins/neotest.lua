return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- adapters
    "nvim-neotest/neotest-python",
  },
  config = function()
    local nt = require("neotest")
    nt.setup({
      adapters = {
        require("neotest-python")({
          args = { "-vv", "-n 0", "--no-cov", "--disable-pytest-warnings" },
        }),
      },
    })
    vim.keymap.set("n", "<leader>rtf", function()
      nt.run.run(vim.fn.expand("%"))
    end, { desc = "[r]un [t]est current [f]ile" })
    vim.keymap.set("n", "<leader>rtn", function()
      nt.run.run()
    end, { desc = "[r]un [t]est [n]earest" })
    vim.keymap.set("n", "<leader>rtd", function()
      nt.run.run({ strategy = "dap" })
    end, { desc = "[r]un [t]est [d]ebug nearest" })
    vim.keymap.set(
      "n",
      "<leader>tn",
      ":Neotest output-panel<CR>:Neotest summary<CR>",
      { desc = "[t]oggle [n]eotest panels" }
    )
  end,

  -- trying and failing for ruby
  --   'nvim-neotest/neotest',
  --   dependencies = {
  --     'nvim-neotest/nvim-nio',
  --     'nvim-lua/plenary.nvim',
  --     'antoinemadec/FixCursorHold.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --     'olimorris/neotest-rspec',
  --   },
  --   config = function()
  --     require('neotest').setup {
  --       adapters = {
  --         require 'neotest-rspec' {
  --           rspec_cmd = function()
  --             return vim.tbl_flatten {
  --               'bundle',
  --               'exec',
  --               'rake',
  --               'rspec',
  --             }
  --           end,
  --         },
  --       },
  --     }
  --   end,
}
