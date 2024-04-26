return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({ settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    } })

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>hl", function()
      toggle_telescope(harpoon:list())
    end, { desc = "[h]arpoon [l]ist" })

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "[h]arpoon [a]dd" })

    vim.keymap.set("n", "<leader>hr", function()
      harpoon:list():remove()
    end, { desc = "[h]arpoon [r]emove" })

    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "[h]arpoon quick [m]enu" })

    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "[h]arpoon select [1]" })
    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "[h]arpoon select [2]" })
    vim.keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "[h]arpoon select [3]" })
    vim.keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "[h]arpoon select [4]" })
    vim.keymap.set("n", "<leader>h5", function()
      harpoon:list():select(5)
    end, { desc = "[h]arpoon select [5]" })
  end,
}
