require('render-markdown').setup({
  lsp_override = {
    markdown = {
      inline_highlight = {
        enable = true,
      }
    }
  },
  win_options = {
    conceallevel = {
      default = 2,
      rendered = 2,
    },
  },
})

