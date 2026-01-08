#####################
# Home Manager Neovim
#####################
{
  config,
  pkgs,
  programs,
  ...
}:

let
  # Import self-contained plugin derivation
  aura-theme = import ./aura-theme { inherit pkgs; };
  # Neovim Conifg Files
  neovimConfig = builtins.path {
    path = ./neovim;
    name = "neovim-config";
  };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true; # make “vi” → “nvim”
    vimAlias = true; # make “vim” → “nvim”
    package = pkgs.neovim-unwrapped; # lean Neovim without bundled plugins

    # Plugins
    plugins =
      with pkgs.vimPlugins;
      [
        # Telescope
        plenary-nvim # Lua utility library (required by Telescope)
        telescope-fzf-native-nvim # fzf-native is a c port of fzf
        telescope-nvim # fuzzy‑finder UI
        # Status line
        lualine-nvim # statusline written in Lua
        # LSP Section
        nvim-lspconfig # LSP client configurations
        nvim-cmp # completion engine plugin
        cmp-nvim-lsp # nvim-cmp source neovim built-in language server client
        vim-terraform # syntax highlighting, indentation and more for HCL and Terraform-related
        # Treesiter
        nvim-treesitter # configurations and abstraction layer for neovim
        nvim-treesitter-context # Lightweights plugin that shows the context of the currently visible buffer contents
        (nvim-treesitter.withPlugins (
          p: with p; [
            c
            go
            hcl
            javascript
            lua
            markdown
            markdown_inline
            nix
            python
            query
            rust
            sql
            terraform
            typescript
            vim
            vimdoc
            zsh
          ]
        ))
      ]
      ++ [ aura-theme ];

    # Inject Lua base setup into init.lua
    extraLuaConfig = ''
            -- Make Lua aware of your config's lua/ dir
            package.path = package.path .. ";${neovimConfig}/lua/?.lua;${neovimConfig}/lua/?/init.lua"

            -- Load your full config from init.lua
            dofile("${neovimConfig}/init.lua")
      	'';
  };

  # Required for language‑servers on your PATH.
  home.packages = with pkgs; [
    # Python
    pyright # Python LSP
    # Node
    nodejs # if you use tsserver, etc.
    # Typscript LSP
    typescript
    typescript-language-server
    # Lua
    lua-language-server # Lua LSP
    # Go lang
    go # Go programming language
    gopls # Go language server (LSP)
    golangci-lint # Linter
    goreleaser # Deliver Go binaries
    gosec # Golang security checker
    delve # Golang Debugger
    # Terraform
    terraform-ls
    # Nix
    nil # Nix language server
    nixpkgs-fmt # Nix formatter
  ];
}
