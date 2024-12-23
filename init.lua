vim.opt.exrc = true -- Allow loading .nvim.lua files from the cwd

vim.opt.nu = true

vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/nvim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- vim.g.netrw_keepdir =  0  -- to make moving files less error-prone
vim.g.netrw_banner = 0       -- remove the banner, enable with I
vim.g.netrw_liststyle = 3    -- tree, can be cycled with i
vim.g.netrw_preview = 1      -- preview in vertical splits, default is horizontal (0)

vim.g.mapleader = " "

-- Open the file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Lex is a bit buggy and if the main buffer is closed then trying to open a file
-- will crash Neovim. Try to figure out how to fix this
vim.keymap.set("n", "<leader>pe", function() vim.cmd.Lex("20") end)

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Execute Lua from a file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "Q", "<nop>")


require("config.floatingwindow")
require("config.lazy")
