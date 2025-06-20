local lspconfig = require('lspconfig')

-- LSP: Python
lspconfig.pyright.setup{}

-- LSP: Lua
lspconfig.lua_ls.setup {
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
}

-- LSP: Go
lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

-- LSP: Nix
lspconfig.nil_ls.setup {
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
}

-- LSP: terraform
require("lspconfig").terraformls.setup {
  filetypes = { "terraform", "tf" },
}

-- LSP: typescript
require'lspconfig'.ts_ls.setup {}
