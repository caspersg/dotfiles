return {
  "gelguy/wilder.nvim",

  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    "romgrk/fzy-lua-native",
  },
  config = function()
    local wilder = require("wilder")
    wilder.setup({
      modes = { ":", "/", "?" },
      next_key = "<C-n>",
      previous_key = "<C-p>",
      accept_key = "<C-y>",
      reject_key = "<Esc>",
    })

    -- simple config
    -- wilder.set_option(
    --   "renderer",
    --   wilder.popupmenu_renderer({
    --     -- highlighter applies highlighting to the candidates
    --     highlighter = wilder.basic_highlighter(),
    --   })
    -- )

    -- fuzzy popup config
    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline({
          fuzzy = 1,
          fuzzy_filter = wilder.lua_fzy_filter(),
        })
      ),
    })
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
        border = "rounded",
        max_height = "75%", -- max height of the palette
        min_height = 0, -- set to the same as 'max_height' for a fixed height window
        min_width = "50%",
        max_width = "50%",
        prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'

        highlighter = {
          -- wilder.basic_highlighter(),
          -- wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
          wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
          -- at https://github.com/romgrk/fzy-lua-native
        },
        highlights = {
          accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
        },
      }))
    )
  end,
}
