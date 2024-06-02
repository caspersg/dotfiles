local function change_nvim_tree_dir()
  local nvim_tree = require("nvim-tree")
  nvim_tree.change_dir(vim.fn.getcwd())
end

return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      -- auto_save_enabled = true,
      -- auto_session_enable_last_session = true,
      -- auto_session_last_session_dir = "~/.local/share/nvim/sessions",
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- read and write shada when switch projects, to save global marks with recall plugin
      post_restore_cmds = { change_nvim_tree_dir, "rshada!" }, --[[ , "NvimTreeOpen" }, ]]
      pre_save_cmds = { "NvimTreeClose", "wshada!" },
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
    vim.keymap.set("n", "<leader>n", require("auto-session.session-lens").search_session, { desc = "search sessio[n]" })
    -- C-s when view is open to switch to alternate
  end,
}
