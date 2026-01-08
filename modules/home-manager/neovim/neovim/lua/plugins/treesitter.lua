-- TreeSitter
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
	  "c",
	  "go",
	  "hcl",
	  "javascript",
	  "lua",
	  "markdown",
	  "markdown-inline",
	  "nix",
	  "python",
	  "query",
	  "rust",
	  "sql",
	  "terraform",
	  "typescript",
	  "vim",
	  "vimdoc",
	  "zsh",
	},

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
