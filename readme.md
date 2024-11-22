**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!


## Java

### JDT (java develop tools) 
[Eclipse JDT Language Server](https://github.com/eclipse-jdtls/eclipse.jdt.ls?tab=readme-ov-file)

The Eclipse JDT Language Server is a Java language specific implementation of the LSP and can be used with any editor that supports the protocol, to offer good support for the Java.


### Colorscheme
LazyVim/LazyVim is too aggressive. So just use folk/lazy.nvim as a plugin manager.

First, let it to give you some color see see.


### LSP

Get started at [https://lsp-zero.netlify.app/docs/tutorial.html#tutorial](https://lsp-zero.netlify.app/docs/tutorial.html)


### Changelog

####  11/22/2024

Since I find LazyVim, NvChad or other openbox nvim repo are too aggressive and it's easy to openbox, but it's hard to learn, configure, and to change your muscle memory, because of these repos are too personal preconfigured.

So let's start to config to all by myself.

#### Choose your plugin manager.

Choose your plugin fighter.  For plugin manager, I'll choose lazy.vim. I just migrate from plug.

#### Using lazy.vim and add your first colorscheme plugin.

First let's prepare our files with a hierachy as below:

```
.
├── init.lua
└── lua
    ├── config
    │   └── lazy.lua
    └── plugins
        └── dracula.lua
```

And just fill up the three files with the following stuff.

```
# cat ~/.config/nvim/init.lua

require('config.lazy')

```

```lua
# cat ~/.config/lua/plugins/draclua.lua

return {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priority = 1000,
  config = function()
  	vim.cmd([[ colorscheme dracula ]])
  end,
}
```

```
# cat ~/.config/lua/config/lazy.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = false },
})

```

All the data is installed in the `~/.local`


#### 

Ok, what's the next?

- [ ] LSP
