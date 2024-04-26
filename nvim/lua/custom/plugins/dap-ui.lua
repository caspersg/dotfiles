return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    require("dapui").setup({
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.15,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.20,
            },
            {
              id = "console",
              size = 0.15,
            },
          },
          position = "right",
          size = 30,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.70,
            },
          },
          position = "bottom",
          size = 30,
        },
      },
    })

    vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
    vim.fn.sign_define("DapStopped", { text = "🔴" })

    vim.keymap.set("n", "<leader>td", function()
      require("dapui").toggle()
    end, { desc = "[t]oggle [d]ebug" })
    -- require('dapui').close()
    vim.keymap.set(
      "n",
      "<leader>dr",
      ':lua require("dapui").remove({reset = true})<CR>',
      { desc = "[d]ebug [r]eset UI" }
    )
    vim.keymap.set("n", "<leader>dl", ':lua require("dap").run_last()<CR>', { desc = "[d]ebug [l]ast" })
    vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "[d]ebug toggle [b]reakpoint" })

    vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "[d]ebug [c]ontinue" })
    vim.keymap.set("n", "<F8>", ":DapTerminate<CR>", { desc = "[d]ebug [t]erminate" })
    vim.keymap.set("n", "<F9>", ":DapContinue<CR>", { desc = "[d]ebug [c]ontinue" })
    vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { desc = "[d]ebug step over" })
    vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", { desc = "[d]ebug step into" })
    vim.keymap.set("n", "<F12>", ":DapStepOut<CR>", { desc = "[d]ebug step out" })
  end,
}
