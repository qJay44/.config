require'nvim-autopairs'.setup{}
require'alpha'.setup(require'alpha.themes.dashboard'.config)
require'bufferline'.setup{ options = { offsets = { { filetype = 'NvimTree', text = 'File manager', padding = 1 } } } }

require('setup')
