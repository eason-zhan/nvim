return {
  -- https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',

  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  }
}
