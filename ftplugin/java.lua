local jdtls = require('jdtls')
local home = vim.env.HOME -- Get the home(~) directory
local project_name = vim.fn.fnamemodify(
    vim.fn.getcwd(),  -- get current working directory
    ':p:h:t:'         -- :p modifier to convert to the absolute path
                      -- :h modifier to return the directory path
                      -- :t modifier to return the tail of the path
)

local workspace_dir = home .. '/.jdtls-workspace-pure/' .. project_name
local jdtls_dir = home .. '/code/github.com/jdtls-1.46.1'

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- 💀
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    "-javaagent:" .. jdtls_dir .. "/lombok_from_projectlombok.org/lombok.jar",
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar',

    -- 💀
    '-configuration', jdtls_dir .. '/config_mac_arm',

    -- 💀
    '-data', workspace_dir
  },

  filetypes = {'java'},

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", ".mvn", "mvnw.cmd"}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {

      home = "/usr/local/jdk",

      contentProvider = { preferred = "fernflower" },

      eclipse = {
        downloadSources = true,
      },
      -- ConfigurationOptions
      configuration = {

        -- maven = {
        --   userSettings = home .. '/.m2/settings.xml',
        --   globalSettings = home .. '/.m2/settings.xml',
        -- },
        --
        updateBuildConfiguration = "interactive",

        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/local/jdk",
          },
        },
      },
      -- MavenOptions
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
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --

  -- Needed for auto-completion with method signatures and placeholders
  -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = {},
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
}

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
