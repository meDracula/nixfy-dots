require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  },
  --  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 1,
    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    max_width = 0.75,
    max_height = 0.75,
    border = "rounded",
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "below",
    -- -- This is the config that will be passed to nvim_open_win.
    -- -- Change values here to customize the layout
    -- override = function(conf)
    --   return conf
    -- end,
  },
})
