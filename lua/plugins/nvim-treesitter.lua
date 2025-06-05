-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  'nvim-treesitter/nvim-treesitter',

  -- `build` is executed when a plugin is installed or updated.
  build = ':TSUpdate',

  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  opts = {
    ensure_installed = {
      'c',
      'cpp',
      'html',
      'java',
      'json',
      'latex',
      'lua',
      'markdown',
      'sql',
      'yaml',
    }, -- just ust TSInstall all

    auto_install = true,

    highlight = {
      enable = true,
    }
  }
}
