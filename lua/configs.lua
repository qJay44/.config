require'nvim-autopairs'.setup{}
require'nvim-tree'.setup{}
require'lualine'.setup{ options = { theme = 'gruvbox_dark' } }
require'alpha'.setup(require'alpha.themes.dashboard'.config)
require'bufferline'.setup{ options = { offsets = { { filetype = 'NvimTree', text = '', padding = 1 } } } }

require('setup')

