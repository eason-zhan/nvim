-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',

  -- `build` is executed when a plugin is installed or updated.
  build = ':TSUpdate',
  
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'c', 'cpp', 'lua', 'java' }, -- just ust TSInstall all

      auto_install = true,

      highlight = {
        enable = true,
      }
    }
  end,
}
