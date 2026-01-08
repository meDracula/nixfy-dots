-- TreeSitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
		"c",
		"c++",
		"go",
		"javascript",
		"lua",
		"markdown",
		"markdown-inline",
		"nix",
		"query",
		"rust",
		"typescript",
		"vim",
		"vimdoc",
	},

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
	}
}
