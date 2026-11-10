local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    python = {"prettier"},
    lua = {"prettier"},
    css = {"prettier"},
    html = {"prettier"},
  },
  formatters = {
    pointer_left = {
      command = "clang-format",
      args = function(_, ctx)
        local home = os.getenv("HOME")
        return {
          "-style=file:" .. home .. "/.config/.clang-format",
          "-assume-filename=" .. ctx.filename,
          '-'
        }
      end,
    }
  }
})

vim.keymap.set('v', '<leader>f', function()
  conform.format({formatters = {"pointer_left"}, lsp_fallback = false})
end)

vim.keymap.set('v', '<leader>F', function()
  conform.format({formatters = {"pointer_left"}, lsp_fallback = false})
end)

