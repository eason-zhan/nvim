require('config.lazy')
require('config.options')
require('config.keymaps')
require('config.autocmd')
require('config.command')

vim.lsp.enable({'luals', 'pyright', 'clangd', 'jdtls'})

vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
  -- Only show virtual line diagnostics for the current cursor line
   current_line = true,
  },
})
