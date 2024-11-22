-- Define a custom command
vim.api.nvim_create_user_command('ColorSchemes', function()
  require('fzf-lua').colorschemes()
end, {})
