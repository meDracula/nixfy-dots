require("core.profile")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.lualine")

-- Set Aura colorscheme
vim.cmd.colorscheme("aura-dark")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highligt when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
