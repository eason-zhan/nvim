return {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_makers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
  },
  on_init = function()
    print('luals now runs in the background')
  end,
}
