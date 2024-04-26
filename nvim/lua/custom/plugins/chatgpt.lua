return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('chatgpt').setup()

    vim.keymap.set('n', '<leader>cgp', ':ChatGPT<CR>', { desc = '[c]ode chat[g]pt [p]rompt' })
    vim.keymap.set({ 'n', 'v' }, '<leader>cgc', ':ChatGPTRun complete_code<CR>', { desc = '[c]ode chat[g]pt [c]omplete' })
    vim.keymap.set({ 'n', 'v' }, '<leader>cgo', ':ChatGPTRun optimize_code<CR>', { desc = '[c]ode chat[g]pt [o]ptimize code' })
    vim.keymap.set({ 'n', 'v' }, '<leader>cgf', ':ChatGPTRun fix_bugs<CR>', { desc = '[c]ode chat[g]pt [f]ix bugs' })
    vim.keymap.set({ 'n', 'v' }, '<leader>cge', ':ChatGPTRun explain_code<CR>', { desc = '[c]ode chat[g]pt [e]xplain code' })
    vim.keymap.set({ 'n', 'v' }, '<leader>cgi', ':ChatGPTEditWithInstructions<CR>', { desc = '[c]ode chat[g]pt edit with [i]nstructions' })
  end,
}
