-- Default root markers for all clients
vim.lsp.config('*', {
	root_markers = { '.git' },
})

-- LSP: Python
vim.lsp.enable('pyright')

-- LSP: Lua
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",  -- Neovim uses LuaJIT
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" }, -- Recognize `vim` as a global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Avoid unnecessary prompts
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- LSP: Go
vim.lsp.config('gopls', {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})
vim.lsp.enable("gopls")

-- LSP: Nix
vim.lsp.config('nil_ls', {
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
})
vim.lsp.enable("nil_ls")

-- LSP: terraform
vim.lsp.config('terraformls', {
  filetypes = { "terraform", "tf" },
})
vim.lsp.enable('terraformls')

-- LSP: typescript
vim.lsp.enable('ts_ls')
