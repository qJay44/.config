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
    enforce_regular_tabs = true,
  },
  highlights = {
    background = {
        fg = '#a89984',
        bg = 'none'
    },
    tab = {
        fg = '#fb4934',
        -- bg = ''
    },
    tab_selected = {
        fg = '#fb4934',
        -- bg = ''
    },
    tab_close = {
        fg = '#fb4934',
        -- bg = ''
    },
    buffer_visible = {
        fg = '#a89984',
        bg = 'none',
    },
    buffer_selected = {
        fg = '#f9f5d7',
        bg = 'none',
        bold = false,
        italic = false,
    },
    close_button = {
        fg = '#fb4934',
        -- bg = ''
    },
    close_button_visible = {
        fg = '#fb4934',
        -- bg = ''
    },
    close_button_selected = {
        fg = '#fb4934',
        -- bg = ''
    },
    indicator_selected = {
        fg = '#b8bb26',
    },
    separator = {
        fg = '#1d2021',
        bg = '#1d2021',
    },
  }
}

