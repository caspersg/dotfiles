return {
  "suketa/nvim-dap-ruby",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dap-ruby").setup()
  end,
}
