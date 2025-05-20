local lemminx = vim.fn.stdpath('data') .. '/mason/bin/lemminx'

return {
  cmd = { lemminx },
  filetypes = { 'xml', 'xsd', 'xsl', 'xslt', 'svg' },
  root_markers = { '.git' },
}
