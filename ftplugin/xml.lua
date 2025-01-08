if vim.fn.executable('lemminx') == 1 then
  vim.notify('Starting Xml Language Server', vim.log.levels.INFO, {})
  vim.lsp.start({
    name = 'Xml Language Server',
    cmd = {'lemminx', '--stdio'},
    root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
  })
  vim.notify('Started Xml Language Server', vim.log.levels.INFO, {})
end
