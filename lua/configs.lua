require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'nvim-autopairs'.setup{}
require'nvim-tree'.setup{}
require'lualine'.setup{ options = { theme = 'powerline' } }
require'alpha'.setup(require'alpha.themes.dashboard'.config)
require'bufferline'.setup{ options = { offsets = { { filetype = 'NvimTree', text = '', padding = 1 } } } }
require('setup')

