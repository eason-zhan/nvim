local opt = vim.opt

-- Line Numbers
opt.number = true

-- Set expandtab to convert tab to spaces
opt.expandtab = true

-- Set 4 spaces for a tab character represents
opt.tabstop = 4

-- Set 4 spaces to use for each step of (auto)ident
opt.shiftwidth = 4

-- Makes `Tab` and `Backspace` feel like a tab is 4 spaces wide.
opt.softtabstop = 4

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

-- no hlsearch
opt.hlsearch = false
