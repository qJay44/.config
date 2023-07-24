local icons = require('setup.icons')
local custom_gruvbox = require('lualine.themes.gruvbox_dark')

-- Remove boldness
custom_gruvbox.normal.a.gui = ''
custom_gruvbox.insert.a.gui = ''
custom_gruvbox.visual.a.gui = ''
custom_gruvbox.command.a.gui = ''

-- Increase visiablility of the "c part" elements in command mode
custom_gruvbox.command.c.fg = '#a89984'
custom_gruvbox.command.c.bg = '#504945'

-- Insert bg will match navic bg
custom_gruvbox.insert.c.bg = custom_gruvbox.normal.c.bg

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true, -- Displays a colored diff status if set to true
        -- diff_color = {
          -- Same color values as the general color option can be used here.
          -- added    = { fg = '#b8bb26' }, -- Changes the diff's added color
          -- modified = { fg = '#fabd2f' }, -- Changes the diff's modified color
          -- removed  = { fg = '#fb4934' }, -- Changes the diff's removed color you
        -- },
        symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
        source = nil, -- A function that works as a data source for diff.
                      -- It must return a table as such:
                      --   { added = add_count, modified = modified_count, removed = removed_count }
                      -- or nil on failure. count <= 0 won't be displayed.
      },
      {
        'diagnostics',
        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { 'nvim_diagnostic', 'coc' },

        -- Displays diagnostics for the defined severity types
        sections = { 'error', 'warn', 'info', 'hint' },

        -- diagnostics_color = {
          -- Same values as the general color option can be used here.
          -- error = { fg = '#fb4934' }, -- Changes diagnostics' error color.
          -- warn  = { fg = },  -- Changes diagnostics' warn color.
          -- info  = { fg = },  -- Changes diagnostics' info color.
          -- hint  = { fg = }  -- Changes diagnostics' hint color.
        -- },
        symbols = {
          error = icons.diagnostics.Error .. ' ',
          warn = icons.diagnostics.Warning .. ' ',
          info = icons.diagnostics.Information .. ' ',
          hint = icons.diagnostics.Hint .. ' '
        },
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false,   -- Show diagnostics even if there are none.
      }
    },
    lualine_c = {
      {
        "navic",
        color_correction = 'static',
        navic_opts = { highlight = true },
        padding = {
          left = 1,
          right = 0
        }
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

