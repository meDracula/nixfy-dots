-- Telescope
require('telescope').setup{
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            show_hidden = true,
            ignore = ".git",
        }
    }
}

require('telescope').load_extension('fzf');
local builtin = require('telescope.builtin');

vim.keymap.set('n', '<leader>ff', builtin.find_files, {});
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end);
