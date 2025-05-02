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

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, server in pairs(servers) do
  if server == 'lua_ls' then
    require('lazydev').setup()
  end

  local exists, module = pcall(require, "setup.lsp.settings." .. server)
  if exists then vim.lsp.config[server] = module end

  vim.lsp.config[server].capabilities = capabilities
  vim.lsp.enable(server)
end

