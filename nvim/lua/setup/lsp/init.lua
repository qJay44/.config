if vim.fn.exists('g:nolsp') == 1 then
  vim.notify('Running w/o lsp', vim.log.levels.INFO)
else
  vim.lsp.set_log_level("error")
  require('setup.lsp.handlers')
end

