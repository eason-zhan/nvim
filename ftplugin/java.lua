-- JDTLS (Java LSP) configuration

local jdtls = require('jdtls')

local home = vim.env.HOME -- Get the home(~) directory
local project_name = vim.fn.fnamemodify(
    vim.fn.getcwd(),  -- get current working directory
    ':p:h:t:'         -- :p modifier to convert to the absolute path
                      -- :h modifier to return the directory path
                      -- :t modifier to return the tail of the path
  )
local workspace_dir = home .. '/.jdtls-workspace/' .. project_name

local share_path = vim.fn.stdpath('data') .. '/mason/share'
-- Needed for debugging
local bundles = {
  vim.fn.glob(share_path .. '/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(share_path .. '/java-test/*.jar', 1), '\n'))

-- See :help vim.lsp.start_client, :help vim.lsp.ClientConfig for an overview of `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. share_path .. "/jdtls/lombok.jar",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    -- Eclipse jdtls location
    "-jar", share_path .. "/jdtls/plugins/org.eclipse.equinox.launcher.jar",
    "-configuration",  share_path .. "/jdtls/config",
    "-data",
    workspace_dir,
  },

  root_dir = vim.fs.root(0, {".git", ".mvn", "mvnw", "gradlew"}),

  settings = {
    java = {
      home = "/usr/local/jdk_21",

      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",

        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/local/jdk_21",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
       implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
      },
       completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    }, -- java
  }, -- settings

  -- capabilities = require("cmp_nvim_lsp").default_capabilities(),

  flags = {
    allow_incremental_sync = true,
  },

  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles,
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
} -- config

-- Needed for debugging
config["on_attach"] = function(client, bufnr)

  jdtls.setup_dap({ hotcodereplace = "auto" })
  require("jdtls.dap").setup_dap_main_class_configs()

end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
