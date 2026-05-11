local icons = require('setup.icons')

local diagConfig = {
  virtual_lines = false,
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "if_many", -- Or "always"
    header = "",
    prefix = "",
    -- width = 40,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN ] = icons.diagnostics.Warning,
      [vim.diagnostic.severity.HINT ] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO ] = icons.diagnostics.Information,
    },
  },
}

vim.diagnostic.config(diagConfig)

require('lsp_signature').setup({
  hint_enable = false,
  floating_window = false
})

require('setup.lsp.mason')

