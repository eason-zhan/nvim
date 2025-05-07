## Nvim

### Basics

```

# vim -u {vimrc}, start vim without the vimrc
nvim -u NONE

# using help doc
:h help
:vert h vert
:hor h hor
```


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

#### Capabilities

Not every language server can support all features defined by the protocol. LSP therefore provides 'capabilities'. *A capability groups a set of language features.*

An editor and the language server announce their support features using capabilities.

*Note*: The actual integration of a language server into a particular editor tool is not defined by the language server protocol and is left to the tool implementors.

The set of capabilities is exchanged between the client and server during the initialize request.

#### Q&A

- Q: How do LSP and Treesitter compare?
- A: LSP requires a client and language server. The language server uses semantic analysis to understand code at a project level. This provides language server with the ability to rename across files, find definitions in external libraries and more.

  treesitter is a language parsing library that provides excellent tools for incrementally parsing text and handling errors. This makes it a greate fit for editors to understand the contents of the current file for things like syntax highlighting, simple goto-definitions, scope analysis and more.

### lsp-events

- LspAttach

After an LSP client performs `initialize` and attaches to a buffer.

- LspDetach

Just before an LSP client detaches from a buffer.

- LspNotify
- LspProgress
- LspRequest

  For each request sent to an LSP server, this event is triggered for every change to the request's status.
    - pending
    - complete
    - cancel

```lua
    vim.api.nvim_create_autocmd('LspRequest', {
      callback = function(args)
        local bufnr = args.buf
        local client_id = args.data.client_id
        local request_id = args.data.request_id
        local request = args.data.request
        if request.type == 'pending' then
          -- do something with pending requests
          track_pending(client_id, bufnr, request_id, request)
        elseif request.type == 'cancel' then
          -- do something with pending cancel requests
          track_canceling(client_id, bufnr, request_id, request)
        elseif request.type == 'complete' then
          -- do something with finished requests. this pending
          -- request entry is about to be removed since it is complete
          track_finish(client_id, bufnr, request_id, request)
        end
      end,
    })
```
- LspTokenUpdate

### lsp-core

vim.lspConfig extends vim.lsp.ClientConfig

*vim.lsp.Config*
    Extends: |vim.lsp.ClientConfig|


    Fields: ~
      • {cmd}?           (`string[]|fun(dispatchers: vim.lsp.rpc.Dispatchers): vim.lsp.rpc.PublicClient`)
                         See `cmd` in |vim.lsp.ClientConfig|.
      • {filetypes}?     (`string[]`) Filetypes the client will attach to, if
                         activated by `vim.lsp.enable()`. If not provided,
                         then the client will attach to all filetypes.
      • {root_markers}?  (`string[]`) Directory markers (.e.g. '.git/') where
                         the LSP server will base its workspaceFolders,
                         rootUri, and rootPath on initialization. Unused if
                         `root_dir` is provided.
      • {root_dir}?      (`string|fun(bufnr: integer, cb:fun(root_dir?:string))`)
                         Directory where the LSP server will base its
                         workspaceFolders, rootUri, and rootPath on
                         initialization. If a function, it is passed the
                         buffer number and a callback argument which must be
                         called with the value of root_dir to use. The LSP
                         server will not be started until the callback is
                         called.
      • {reuse_client}?  (`fun(client: vim.lsp.Client, config: vim.lsp.ClientConfig): boolean`)
                         Predicate used to decide if a client should be
                         re-used. Used on all running clients. The default
                         implementation re-uses a client if name and root_dir
                         matches.


### commands vim.lsp.commands

  Registry for client side commands. This is an extension point for plugins to handle custom commands which are not part of the core language server protocol specification.

  The **registry** is a table where the key is a unique command name, and the value is a function which is called if any LSP action (code action, code lenses, ..) triggers the command.


##### Examples `config({name}, {cfg})`
- Add a root marker for all clients.

```lua
      vim.lsp.config('*', {
        root_markers = {'.git'}
      })


```

• Add additional capabilities to all clients:
```lua
        vim.lsp.config('*', {
          capabilities = {
            textDocument = {
              semanticTokens = {
                multilineTokenSupport = true,
              }
            }
          }
        })
```

    • (Re-)define the configuration for clangd:
```lua
        vim.lsp.config.clangd = {
          cmd = {
            'clangd',
            '--clang-tidy',
            '--background-index',
            '--offset-encoding=utf-8',
          },
          root_markers = { '.clangd', 'compile_commands.json' },
          filetypes = { 'c', 'cpp' },
        }
```

enable({name}, {enable}

 Enable an LSP server to automatically start when opening a buffer.

    Uses configuration defined with `vim.lsp.config`.

    Examples: >lua
          vim.lsp.enable('clangd')

          vim.lsp.enable({'luals', 'pyright'})
<

- set_log_level({level})

Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"











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

[Config LSP is simple](https://www.reddit.com/r/neovim/comments/12itdmx/psa_configuring_lsp_wo_nvimlspconfig_is_simple/)

Just use mason-nvim to install LSP server(jdtls), and install nvim-jdtls to config for my java project.

- [ ] LSP

[Config LSP without plugins](https://lsp-zero.netlify.app/blog/lsp-config-without-plugins)

