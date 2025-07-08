local bin_path = vim.fn.stdpath('data') .. '/mason/bin'

return {
  cmd = { bin_path .. '/vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
}
