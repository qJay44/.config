local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    ["py"] = {"prettier"}
  },
  formatters = {
    pointer_left = {
      command = "clang-format",
      args = { "--style={BasedOnStyle: InheritParentConfig, PointerAlignment: Left}" },
    }
  }
})

vim.keymap.set('v', '<leader>f', function()
  conform.format({formatters = {"pointer_left"}, lsp_fallback = false})
end)

