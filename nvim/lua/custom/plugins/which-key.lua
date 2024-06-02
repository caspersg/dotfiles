return {
  -- Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end
  --

  -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").register({
      ["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
      ["<leader>d"] = { name = "[d]ebug/diff/document", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
      -- ["<leader>w"] = { name = "[w]orkspace", _ = "which_key_ignore" },
      ["<leader>b"] = { name = "[b]uffer", _ = "which_key_ignore" },
      ["<leader>bf"] = { name = "[b]uffer [f]orce", _ = "which_key_ignore" },
      ["<leader>m"] = { name = "[m]arks", _ = "which_key_ignore" },
      ["<leader>md"] = { name = "[m]arks [d]elete", _ = "which_key_ignore" },
      ["<leader>t"] = { name = "[t]oggle", _ = "which_key_ignore" },
      ["<leader>cg"] = { name = "[c]ode chat[g]pt", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "[r]un", _ = "which_key_ignore" },
      ["<leader>rt"] = { name = "[r]un [t]est", _ = "which_key_ignore" },
      ["<leader>l"] = { name = "[l]sp", _ = "which_key_ignore" },
      ["<leader>ls"] = { name = "[l]sp [s]ymbol", _ = "which_key_ignore" },
      ["<leader>p"] = { name = "[p]aste substitute", _ = "which_key_ignore" },
      ["<leader>y"] = { name = "[y]ank", _ = "which_key_ignore" },
      -- ["<leader>h"] = { name = "[h]arpoon", _ = "which_key_ignore" },
    })
  end,
}
