local bufferline = require('bufferline')

bufferline.setup {
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File manager',
        padding = 1,
        text_align = "center",
        separator = true
      }
    },
    indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        -- style = 'underline',
    },
    enforce_regular_tabs = false,
  },
  highlights = {
    fill = {
      bg = '#191919'
    },
    background = {
        fg = '#a89984',
        bg = 'none'
    },
    buffer_visible = {
        fg = '#a89984',
        bg = 'none',
    },
    buffer_selected = {
        fg = '#80a0ff',
        bg = 'none',
        bold = false,
        italic = false,
    },
    close_button ={
      fg = '#a89984'
    },
    close_button_visible ={
      fg = '#a89984'
    },
    close_button_selected = {
      fg = '#80a0ff'
    },
    indicator_selected = {
        fg = '#80a0ff',
    },
    separator = {
        fg = '#1d2021',
        bg = '#1d2021',
    },
  }
}

