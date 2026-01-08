-- setup map leader
vim.g.mapleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Diable mouse
vim.opt.mouse = ""

-- tabing
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Copy from clipboard
-- vim.opt.clipboard = "unnamedplus" -- Consideration;

-- save
vim.keymap.set("n", "<leader>s", ":update<CR>")

-- Set Spell check on or off
vim.keymap.set("n", "<leader>l", ":setlocal spell! spelllang=en_us<CR>")

-- Sourcing file options
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<space>i", ":InspectTree<CR>")
