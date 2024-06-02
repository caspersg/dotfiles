return {
  "bloznelis/before.nvim",
  config = function()
    local before = require("before")
    before.setup({
      -- How many edit locations to store in memory (default: 10)
      history_size = 100,
      -- Wrap around the ends of the edit history (default: false)
      history_wrap_enabled = true,
    })

    require("telescope").load_extension("before")

    -- Jump to previous entry in the edit history
    vim.keymap.set("n", "<C-h>", before.jump_to_last_edit, { desc = "last edit" })

    -- Jump to next entry in the edit history
    vim.keymap.set("n", "<C-l>", before.jump_to_next_edit, { desc = "next edit" })

    -- Look for previous edits in telescope (needs telescope, obviously)
    vim.keymap.set("n", "<leader>sb", before.show_edits_in_telescope, { desc = "[s]earch [b]efore changes" })
  end,
}
