return {
  "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = {"BufReadPre", "BufNewFile"},
    config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
	additional_vim_regex_highlighting = false,
      },
      -- enable indentation
      indent = { enable = true },
        auto_install = true, -- auto install syntax support when enter new file type buffer 
      -- ensure these language parsers are installed
      ensure_installed = {
        "c",
        "cpp",
        "json",
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "prisma",
        "query",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "yaml",
	},
	incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>s",
          node_incremental = "<leader>s",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
