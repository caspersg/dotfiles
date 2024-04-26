return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      view = {
        merge_tool = {
          layout = 'diff4_mixed',
          disable_diagnostics = false,
        },
      },
    }

    vim.keymap.set('n', '<leader>do', vim.cmd.DiffviewOpen, { desc = '[d]iff view [o]pen' })
    vim.keymap.set('n', '<leader>dq', vim.cmd.DiffviewClose, { desc = '[d]iff view [q]uit' })
  end,
}
