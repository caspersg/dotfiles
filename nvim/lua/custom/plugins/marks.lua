return {
  'chentoast/marks.nvim',
  config = function()
    require('marks').setup {
      -- just use the built in mappings
      default_mappings = true,
    }
  end,
}
