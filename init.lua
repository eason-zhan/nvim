require('config.lazy')
require('config.options')
require('config.keymaps')
require('config.autocmd')
require('config.command')

vim.lsp.enable({'luals', 'pyright', 'clangd', 'lemminx'})
