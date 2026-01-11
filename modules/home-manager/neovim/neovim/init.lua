require("core.profile")
require("core.lsp")
require("core.terminal")
require("plugins.oil")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.completion")

-- Set Aura colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#15141b" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#15141b" })
  end,
})
vim.cmd.colorscheme("aura-dark")
