-- diff some text in two new buffers
function SplitAndDiff()
  vim.cmd("enew")
  vim.cmd("new")
  vim.cmd("windo diffthis")
end
vim.api.nvim_create_user_command("SplitAndDiff", SplitAndDiff, {})
vim.keymap.set("n", "<leader>ds", ":SplitAndDiff<CR>", { desc = "[d]iff a [s]plit of 2 new buffers" })

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[l]sp [f]ormat" })

function SetFiletype(filetype)
  vim.bo.filetype = filetype
  -- Trigger FileType event to start the LSP client
  vim.cmd("doautocmd filetypedetect BufRead " .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)))
end

vim.api.nvim_create_user_command("SetFiletype", function(opts)
  SetFiletype(opts.args)
end, { nargs = 1 })
vim.keymap.set("n", "<leader>frb", ":SetFiletype ruby<CR>", { desc = "set [f]iletype [r]u[b]y" })
vim.keymap.set("n", "<leader>fjo", ":SetFiletype json<CR>", { desc = "set [f]iletype [j]s[o]n" })
vim.keymap.set("n", "<leader>fpy", ":SetFiletype python<CR>", { desc = "set [f]iletype [p][y]thon" })
vim.keymap.set("n", "<leader>fjs", ":SetFiletype javascript<CR>", { desc = "set [f]iletype [j]ava[s]cript" })
vim.keymap.set("n", "<leader>fts", ":SetFiletype typescript<CR>", { desc = "set [f]iletype [t]ype[s]cript" })
vim.keymap.set("n", "<leader>fjv", ":SetFiletype java<CR>", { desc = "set [f]iletype [j]a[v]a" })

function SplitFiletype(filetype)
  vim.cmd("enew")
  SetFiletype(filetype)
  -- second buffer in a new split
  vim.cmd("new")
  SetFiletype(filetype)
end

vim.api.nvim_create_user_command("SplitFiletype", function(opts)
  SplitFiletype(opts.args)
end, { nargs = 1 })

vim.keymap.set("n", "<leader>dfrb", ":SplitFiletype ruby<CR>", { desc = "[d]iff [f]ormat [s]plit [r]u[b]y" })
vim.keymap.set("n", "<leader>dfjo", ":SplitFiletype json<CR>", { desc = "[d]iff [f]ormat [s]plit [j]s[o]n" })
vim.keymap.set("n", "<leader>dt", ":windo diffthis<CR>", { desc = "[d]iff [t]his split" })

-- split diff with format steps
-- 1. leader dfjo
-- 2. paste into both buffers
-- 3. leader lf in both buffers
-- 4. leader dt
-- 5. :diffoff
