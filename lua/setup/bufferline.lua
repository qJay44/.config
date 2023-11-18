---@diagnostic disable: missing-fields

local bufferline = require('bufferline')
local fillBg = '#191919'

if (TransparentMode) then
  fillBg = 'none'
end

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
      bg = fillBg
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
    separator_visible = {
      fg = '#1d2021',
      bg = '#1d2021',
    },
    separator_selected = {
      fg = '#1d2021',
      bg = '#1d2021',
    },
    offset_separator = {
      fg = '#1d2021',
      bg = '#1d2021',
    },
  }
}

