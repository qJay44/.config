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
  'glsl_analyzer',
  'bashls',
}

mason.setup({
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
})

-- mason_lspconfig.setup {
--   ensure_installed = servers,
--   automatic_installation = true,
-- }
mason_nvim_dap.setup {
  ensure_installed = { 'cpptools' },
  automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.editsNearCursor = true

for _, server in pairs(servers) do
  vim.lsp.enable(server)

  if server == 'lua_ls' then
    require('lazydev').setup()
  elseif server == 'bashls' then
    vim.lsp.config['bashls'].filetypes = {'bash', 'sh', 'zsh'}
  end

  local exists, settings = pcall(require, "setup.lsp.settings." .. server)
  if exists then vim.lsp.config[server].settings = settings end

  vim.lsp.config[server].capabilities = capabilities
end

