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

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

mason_nvim_dap.setup {
  ensure_installed = { 'cpptools' },
  automatic_installation = true,
}

-- Custom LSP hover handler to clean Clangd's double-escaped markdown sequences
local origOpenFloatPreview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"

  if type(contents) == "table" then
    for i, line in ipairs(contents) do
      -- Add manually if goes wrong
      -- line = line:gsub([[\`]], "`")
      -- line = line:gsub([[\_]], "_")
      contents[i] = line:gsub([[\]], "")
    end
  end

  local f_buf, f_win = origOpenFloatPreview(contents, syntax, opts, ...)
  if f_buf and f_win then
    vim.wo[f_win].conceallevel = 2
    vim.wo[f_win].concealcursor = "n"
  end

  return f_buf, f_win
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.editsNearCursor = true

vim.lsp.config('*', {
  on_attach = function(_, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Sanitized LSP Hover" })
  end,
})

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

