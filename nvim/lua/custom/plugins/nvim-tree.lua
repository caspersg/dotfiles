return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      update_focused_file = { enable = true },
      view = { width = 60 },
    }
    vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeToggle, { desc = '[t]oggle [f]ile browser nvim tree' })
  end,
}
