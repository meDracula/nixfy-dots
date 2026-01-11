-- Trouble
-- local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
-- local add_to_trouble = require("trouble.sources.telescope").add

-- Telescope
require('telescope').setup {
  defaults = {
    theme = "ivy",
    disable_devicons = true,
    mappings = {
      i = { ["<space>ft"] = open_with_trouble },
      n = { ["<space>ft"] = open_with_trouble },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      show_hidden = true,
      ignore = ".git",
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
      disable_devicons = true,
    },
    buffers = {
      theme = "ivy",
      disable_devicons = true,
    },
    live_grep = {
      theme = "ivy",
      disable_devicons = true,
    },
    command_history = {
      theme = "ivy",
      disable_devicons = true,
    },
    lsp_references = {
      theme = "ivy",
      disable_devicons = true,
    }
  }
}

require('telescope').load_extension('fzf');
local builtin = require('telescope.builtin');

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' });
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' });
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' });
vim.keymap.set('n', '<leader>fh', builtin.command_history, { desc = 'Telescope command history' });
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope lsp references' });
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end);
-- vim.keymap.set('n', '<leader>fh', builtin.commands, {});
