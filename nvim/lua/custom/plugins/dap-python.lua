return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local python_bin = "~/.virtualenvs/debugpy/bin/python" -- vim.fn.expand("$HOME") .. "/.pyenv/shims/python"

    -- require("dap-python").setup("~/.pyenv/shims/python")
    -- require("dap-python").resolve_python = function()
    --   return "~/.pyenv/shims/python"
    -- end

    local dap = require("dap")
    -- local dap_python = "$XDG_DATA_HOME/nvim/mason/packages/venv/bin/python"
    require("dap-python").setup(python_bin)
    require("dap-python").test_runner = "pytest"
    vim.keymap.set({ "n", "v" }, "<Leader>dt", function()
      require("dap-python").test_method()
    end)

    -- manual steps
    -- mkdir .virtualenvs
    -- cd .virtualenvs
    -- python -m venv debugpy
    -- debugpy/bin/python -m pip install debugpy
    -- python -m pip install pytest

    -- require("dap-python").setup("~/.pyenv/shims/python", {
    --   pythonPath = python_bin,
    --   resolve_python = python_bin,
    --   debugpyPath = vim.fn.stdpath("data") .. "/mason/bin" .. "/debugpy",
    -- })
    --
    -- require("dap-python").test_runner = "pytest"
    -- -- manual steps? install pytest
    -- -- cd ~/.local/share/nvim/mason/packages/debugpy/
    -- -- source venv/bin/activate
    -- -- (venv) python -m pip install pytest
    --
    -- local dap = require("dap")
    -- dap.adapters.python = {
    --   type = "executable",
    --   command = python_bin,
    --   args = { "-m", "debugpy.adapter" },
    -- }
    --
    -- dap.configurations.python = {
    --   {
    --     -- The first three options are required by nvim-dap
    --     type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    --     request = "launch",
    --     name = "Launch file",
    --
    --     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    --
    --     program = "${file}", -- This configuration will launch the current file if used.
    --     pythonPath = function()
    --       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    --       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    --       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    --       local cwd = vim.fn.getcwd()
    --       if vim.fn.executable(cwd .. python_bin) == 1 then
    --         return cwd .. python_bin
    --       elseif vim.fn.executable(cwd .. python_bin) == 1 then
    --         return cwd .. python_bin
    --       else
    --         return python_bin
    --       end
    --     end,
    --   },
    -- }
    --
    -- require("dap").configurations.python = {
    --   {
    --     name = "Pytest: Current File",
    --     type = "python",
    --     request = "launch",
    --     module = "pytest",
    --     args = {
    --       "${file}",
    --       "-sv",
    --       "--log-cli-level=INFO",
    --       "--log-file=test_out.log",
    --     },
    --     console = "integratedTerminal",
    --   },
    -- }
  end,
}
