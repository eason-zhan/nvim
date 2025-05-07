return {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_makers = {
    '.luarc.json',
    '.luarc.jsonc',
  },
  on_init = function()
    print('luals now runs in the background')
  end,
}
