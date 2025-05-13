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


### LazyVim vs lazy.nvim
LazyVim/LazyVim is too aggressive. So just use folk/lazy.nvim as a plugin manager.

First, let it to give you some color see see.


### LSP

Get started at [https://lsp-zero.netlify.app/docs/tutorial.html#tutorial](https://lsp-zero.netlify.app/docs/tutorial.html)

#### Capabilities

Not every language server can support all features defined by the protocol. LSP therefore provides 'capabilities'. A capability groups a set of language features. An editor and the language server announce their support features using capabilities.

*Note*: The actual integration of a language server into a particular editor tool is not defined by the language server protocol and is left to the tool implementors.

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

####

Ok, what's the next?

[Config LSP is simple](https://www.reddit.com/r/neovim/comments/12itdmx/psa_configuring_lsp_wo_nvimlspconfig_is_simple/)

Just use mason-nvim to install LSP server(jdtls), and install nvim-jdtls to config for my java project.

- [ ] LSP

[Config LSP without plugins](https://lsp-zero.netlify.app/blog/lsp-config-without-plugins)

#### jdtls
[Running the JAVA LS server from the command line](https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request)
[Lombok Configuration System]://projectlombok.org/features/configuration
[What's New in Neovim 0.11](https://gpanders.com/blog/whats-new-in-neovim-0-11/#more-default-mappings)
[A guide on Neovim's LSP client](https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/)
