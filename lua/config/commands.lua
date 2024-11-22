-- Define a custom command
vim.api.nvim_create_user_command('ColorSchemes', function()
  require('fzf-lua').colorschemes()
end, {})

-- Set filetype for alias file
-- au BufRead,BufNewFile *.alias set filetype=zsh
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.alias',

  callback = function() 
    vim.bo.filetype = 'zsh' -- Use 'vim.bo' for buffer-local options.
  end
})


-- Set local options for Python filetype
-- au FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent 
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',

  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4 
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4 
    vim.opt_local.autoindent = true 
  end,

})
