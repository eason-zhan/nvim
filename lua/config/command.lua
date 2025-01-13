-- ColorSchemes
vim.api.nvim_create_user_command('ColorSchemes', function()
  require('fzf-lua').colorschemes()
end, {})


-- Create a custom command for fzf_grep
vim.api.nvim_create_user_command('Ag', function(opts)
    require('fzf-lua').grep({ search = opts.args })
end, { nargs = 1 })  -- Expect one argument

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
