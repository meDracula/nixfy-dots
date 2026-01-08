local lsp = vim.lsp.config

-- LSP: Python
lsp.pyright.setup{}

-- LSP: Lua
lsp.lua_ls.setup {
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
lsp.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lsp.util.root_pattern("go.work", "go.mod", ".git"),
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
lsp.nil_ls.setup {
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
}

-- LSP: terraform
lsp.terraformls.setup {
  filetypes = { "terraform", "tf" },
}

-- LSP: typescript
lsp.ts_ls.setup {}
