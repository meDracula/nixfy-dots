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

-- Quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>") -- Alt+j
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>") -- Alt+k

-- Sourcing file options
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- TreeSitter Inspect Tree
vim.keymap.set("n", "<space>i", ":InspectTree<CR>")

-- Oil
vim.keymap.set("n", "<space>o", ":Oil --float<CR>")

-- Yank on Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highligt when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
