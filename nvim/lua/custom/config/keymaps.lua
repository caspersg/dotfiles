-- custom keymaps (
-- Most keymaps will be defined in the plugin

-- use ; for command mode, far more common than next search
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("v", ":", ";", { noremap = true })
vim.api.nvim_set_keymap("v", ":", ";", { noremap = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- TODO why does <C-.> call NvimTreeToggle ?
-- just something weird in windows WSl
--vim.keymap.set("n", "<C-.>", "<C-o>", {})
--vim.keymap.set("n", "<C-,>", "<C-i>", {})

vim.keymap.set({ "i", "n" }, "<C-s>", "<ESC>:w<CR>", { desc = "[s]ave buffer" })

vim.keymap.set("n", "<leader>mda", ":delm! | delm A-Z<CR>", { desc = "[m]arks [d]elete [a]ll" })
-- using substitute plugin instead
-- vim.keymap.set("x", "<leader>p", '"_dP', { desc = "[p]aste keep register", noremap = true })
vim.keymap.set("n", "<leader>yf", ":let @+ = expand('%p')<CR>", { desc = "[y]ank current [f]ile relative" })
vim.keymap.set("n", "<leader>yF", ":let @+ = expand('%:p')<CR>", { desc = "[y]ank current [F]ile absolute" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "[b]uffer [d]elete" })
vim.keymap.set("n", "<leader>bfd", ":bd!<CR>", { desc = "[b]uffer [f]orce [d]elete " })
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "[b]uffer [n]ext" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "[b]uffer [p]previous" })
vim.keymap.set("n", "<leader>ba", ":enew<CR>", { desc = "[b]uffer [a]ppend" })
vim.keymap.set("n", "<leader>bc", ":%bd|e#|bd#<CR>", { desc = "[b]uffer delete all except [c]urrent" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move visual block up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move visual block down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor position when joining lines" })

-- keep the cursor in the middle (
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- )
-- don't enter special mode
vim.api.nvim_set_keymap("n", "Q", "<Nop>", { noremap = true })

vim.keymap.set("n", "<C-a>", "q:", { desc = "Command mode window" })

vim.keymap.set("c", "<Esc>", "<C-c>", { desc = "Exit command mode without running command" })

vim.keymap.set("n", "<leader>cs", "z=", { desc = "[c]ode [s]pell check fix" })

vim.keymap.set("n", "<S-u>", ":redo<CR>", { desc = "redo" })

-- custom keymaps )

-- notes (
--  jump:
--    alternate file: C-^
--    back: C-o
--    forward: C-i
--  marks: https://github.com/chentoast/marks.nvim
--    local: m a
--    global: m A
--    goto: '
--    delete all: leader md
--    toggle mark: m;
--
--  lsp:
--    goto: leader g
--    code action: leader ca
--    type def: leader D
--    workspace symbols: leader ws
--    rename: leader rn
--    docs: K
--    refactor: :Refactor
--
--  find:
--    file: :find *substring
--    file: leader s f substring
--    buffer: :b substring
--    buffer: leader space substring
--
--  search:
--    fuzzy in buffer: leader /
--    grep in buffer: leader s /
--    grep in files: leader sg
--    search word: leader sw
--
--  search replace:
--    spectre toggle: leader sr
--    visual search: leader sv
--    search word current file: leader sc
--    line: :s/old/new/gc
--    file: :%s/old/new/gc
--
-- comment toggle line: gcc
--
--  file browser:
--    open NvimTree: C-n
--    mini.files: leader mf
--    telescope files: leader sF
--
--  buffer:
--    new leader bn
--    delete leader bd
--
--  split arguments toggle: gS
--
--  diff:
--    diff open windows: :windo diffthis
--    close diff: :windo diffoff
--
--  merge conflicts:
--    open: leader do
--    close: leader dc
--
--  git:
--    git: :G
--    git pull: :G p p
--    git checkout branch: :G b l
--    git log: :G l l
--    git file log: leader s t bcommits
--
--  undo:
--    show undo history: leader u
--
--  column vertical visual: C-q
--
--  scroll:
--    up: C-u or Cy
--    down: C-d or C-e
--
--  debug:
--    toggle debug views: leader td
--    toggle breakpoint: leader db
--    start continue: leader dc
--    start continue: F9
--    step over: F10
--    step into: F11
--    step out: F12
--
--  shell toggle: C-\
--
--  spell check:
--    fix under cursor: z=
--    fix under cursor: leader cs
--
--  registers:
--    paste current buffer file path: "%p

--
-- notes )
