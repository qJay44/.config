local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_nvim_dap = require('mason-nvim-dap')

local servers = {
  'clangd',
  'cssls',
  'html',
  'lua_ls',
  'ts_ls',
  'pyright',
  'ruff',
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
  end

  local exist, module = pcall(require, "setup.lsp.settings." .. server)
	if exist then opts = vim.tbl_deep_extend("force", module, opts) end
  lspconfig[server].setup(opts)
end

