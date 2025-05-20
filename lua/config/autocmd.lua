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

-- h gq, to check gq{motion}
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',

  callback = function()
    vim.opt_local.formatprg = 'jq'
  end,

})

-- Add lsp keymappings
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',

  callback = function (args)
    local mapper = function (mode, key, cmd)
      local opts = {buffer = args.buf}
      vim.keymap.set(mode, key, cmd, opts)
    end

    -- Trigger Code completion
    mapper('i', '<C-Space>', '<C-x><C-o>')

    -- Display documentation of the symbol under the cursor
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    mapper('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    mapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    mapper('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    mapper('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    -- vim.11 default grr
    -- mapper('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Format current file
    mapper({'n', 'v'}, 'gq', '<cmd>lua vim.lsp.buf.format()<cr>')

    -- Selects a code action available at the current cursor position
    -- mapper('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  end
})


