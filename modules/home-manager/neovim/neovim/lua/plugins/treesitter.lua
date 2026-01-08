-- TreeSitter
require'nvim-treesitter.configs'.setup {
    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
	},

	indent = {
		enable = true,
	},
}
