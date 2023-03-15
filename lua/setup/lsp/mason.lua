local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return vim.notify('mason', 'error', { title = 'Plugin call fail' })
end

local status_ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok1 then
  return vim.notify('mason-lspconfig', 'error', { title = 'Plugin call fail' })
end

-- 'lua_ls' is 'sumneko_lua' but have to use old name for 'ensure_installed'
local servers = {
  'clangd',
  'cssls',
  'html',
  'sumneko_lua',
  'tsserver',
  'pyright'
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return vim.notify('lspconfig', 'error', { title = 'Plugin call fail' })
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('setup.lsp.handlers').on_attach,
    capabilities = require('setup.lsp.handlers').capabilities
  }

  server = vim.split(server, '@')[1]

  if server == 'lua_ls' then
    local l_status_ok, neo_dev = pcall(require, 'neodev')
    if not l_status_ok then
      return vim.notify('neodev', 'error', { title = 'Plugin call fail' })
    end

    local neodev = neo_dev.setup {
      lspconfig = {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities
      }
    }
    lspconfig.lua_ls.setup(neodev)

    goto continue
  end

  if server == "tsserver" then
    local tsserver_opts = require "setup.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "setup.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

