-- Telescope
require('telescope').setup {
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
    -- TODO { key = { theme = ivy } for key in [ find_files, command_history, buffers, lsp_references]}
    find_files = {
      theme = "ivy",
    },
    command_history = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    lsp_references = {
      theme = "ivy",
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
