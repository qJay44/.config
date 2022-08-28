local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  print('call fail: lspconfig')
end

require 'setup.lsp.lsp-signature'
require('setup.lsp.mason')
require('setup.lsp.handlers').setup()

