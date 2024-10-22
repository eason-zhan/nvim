local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Set expandtab to convert tab to spaces
opt.expandtab = true

-- Set 4 spaces for a tab character represents
opt.tabstop = 4

-- Set 4 spaces to use for each step of (auto)ident
opt.shiftwidth = 4 

-- Makes `Tab` and `Backspace` feel like a tab is 4 spaces wide.
opt.softtabstop = 4

-- Enables auto indent from the previous line
opt.autoindent = true

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

vim.cmd[[colorscheme dracula]]

-- Define a custom command
vim.api.nvim_create_user_command('Colorscheme', function(opts)
    -- This is the function that gets called when you run :MyCommand
    require('telescope.builtin').colorscheme()
end, {})
