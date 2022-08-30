local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return vim.notify('lspconfig', 'error', { title = 'Plugin call fail' })
end

require 'setup.lsp.lsp-signature'
require('setup.lsp.mason')
require('setup.lsp.handlers').setup()

