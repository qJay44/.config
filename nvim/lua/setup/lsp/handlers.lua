local icons = require('setup.icons')
local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error, numhl = 'DiagnosticSignError'},
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning, numhl = 'DiagnosticSignWarn'},
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint, numhl = 'DiagnosticSignHint' },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.Information, numhl = 'DiagnosticSignInfo' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.numhl })
end

local diagConfig = {
  virtual_lines = false,
  virtual_text = false,
  signs = { active = signs },
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
}

vim.diagnostic.config(diagConfig)

require('lsp_signature').setup({
  hint_enable = false,
  floating_window = false
})

require('setup.lsp.mason')

