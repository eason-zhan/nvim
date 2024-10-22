-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ";"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        {
            { import = "plugins" },
            { 'VonHeikemen/lsp-zero.nvim',        branch = 'v4.x' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
        },
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})


-- https://lsp-zero.netlify.app/docs/tutorial.html#tutorial
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be excecuted before you configure any language server
local lsp_conf = require('lspconfig').util.default_config
lsp_conf.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_conf.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

-- Setup Lua Language Server
require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',  -- Specify the Lua version
            },
            diagnostics = {
                globals = { 'vim' },  -- Recognize vim as a global variable
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),  -- Use Neovim runtime files
            },
            telemetry = {
                enable = false,  -- Disable telemetry
            },
        },
    },
}
