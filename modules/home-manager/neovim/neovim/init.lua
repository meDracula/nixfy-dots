require("core.profile")
require("core.lsp")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.treesitter")

-- Set Aura colorscheme
vim.cmd.colorscheme("aura-dark")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highligt when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.cmd [[hi @function.builtin guifg=yellow]]
