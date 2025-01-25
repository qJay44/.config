if vim.fn.exists('g:nolsp') == 1 then
  vim.notify('Running w/o lsp', vim.log.levels.INFO)
else
  require('lspconfig')
  require('setup.lsp.lsp-signature')
  require('setup.lsp.mason')
  require('setup.lsp.handlers').setup()
end


