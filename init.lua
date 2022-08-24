vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.g.mapleader = ' '
vim.cmd([[ so ~/AppData/Local/nvim/legacy.vim ]])

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('n', '<leader>so', ':w<CR>:so ~/AppData/Local/nvim/init.lua<CR>', {})
keymap('n', '<F6>', ':NvimTreeToggle<CR>', {})
keymap('i', '<F6>', '<Esc>:NvimTreeToggle<CR>', {})

local opts = { noremap=true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<c-p>', ':Files<CR>', opts)
keymap('n', '<leader>h', ':History<CR>', opts)

--- Plugins -------------------------------------

require('packer').startup({function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use 'morhetz/gruvbox'
  use 'wakatime/vim-wakatime'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'airblade/vim-rooter'
  use 'tpope/vim-dispatch'
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'zefei/vim-colortuner'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ntpeters/vim-better-whitespace'
  use 'windwp/nvim-autopairs'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-fugitive'
  use 'ap/vim-css-color'
  use 'ryanoasis/vim-devicons'
  use 'onsails/lspkind.nvim'
  use 'sainnhe/gruvbox-material'
  use 'p00f/nvim-ts-rainbow'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'mhinz/vim-signify'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly'
  }
end,
config = {
  display = {
    open_fn = require('packer.util').float
  }
}})

-------------------------------------------------

--- Configs setup -------------------------------

require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'nvim-autopairs'.setup{}
require'nvim-tree'.setup{}
require'nvim-treesitter.install'.compilers = { 'clang' }
require'alpha'.setup(require'alpha.themes.dashboard'.config)
require'nvim-treesitter.configs'.setup{
  ensure_installed = { "cpp", "python", "javascript", "lua", "glsl" },
  highlight = { enable = true, additional_vim_regex_highlighting = true },
  rainbow = { enable = true, extended_mode = true, max_file_lines = nil }
}
require'toggleterm'.setup{
  size = 20,
  open_mapping = [[<c-\]],
}
-------------------------------------------------

--- cmp setup -----------------------------------

local lspkind = require('lspkind')
local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
	require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<S-n>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently elected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping.confirm {
	  behavior = cmp.ConfirmBehavior.Insert,
	  select = true
      }
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 3, max_item_count = 15 },
        { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format {
	with_text = true,
	menu = {
	  nvim_lsp = '[LSP]',
	  buffer = '[buf]'
	}
      }
    }
})

-------------------------------------------------

