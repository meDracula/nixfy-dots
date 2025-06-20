-- setup map leader
vim.g.mapleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Diable mouse
vim.opt.mouse = ""

-- tabing
vim.opt.expandtab = true -- Plejdify use space over tabs :(
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- save
vim.keymap.set("n", "<leader>s", ":update<CR>")

-- Set Spell check on or off
vim.keymap.set("n", "<leader>l", ":setlocal spell! spelllang=en_us<CR>")

