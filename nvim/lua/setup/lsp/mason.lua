local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_nvim_dap = require('mason-nvim-dap')

local servers = {
  'clangd',
  'cssls',
  'html',
  'lua_ls',
  'tsserver',
  'pyright',
  'ruff_lsp',
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
mason_nvim_dap.setup {
  ensure_installed = { 'cpptools' },
  automatic_installation = true,
}

local lspconfig = require("lspconfig")
local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('setup.lsp.handlers').on_attach,
    capabilities = require('setup.lsp.handlers').capabilities
  }

  if server == 'lua_ls' then
    require('neodev').setup()

    local lua_ls_opts = require "setup.lsp.settings.lua_ls"
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require "setup.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "setup.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "ruff_lsp" then
    local ruff_lsp_opts = require "setup.lsp.settings.ruff_lsp"
    opts = vim.tbl_deep_extend("force", ruff_lsp_opts, opts)
  end

  lspconfig[server].setup(opts)
end

