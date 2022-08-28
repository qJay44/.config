local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  print('call fail: packer')
end

-- Customize packer window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
    prompt_border = 'rounded'
  }
}

-- Plugins install
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorschemes
  use 'tomasr/molokai'
  use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'

  use 'wakatime/vim-wakatime'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'airblade/vim-rooter'
  use 'tpope/vim-dispatch'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'ray-x/lsp_signature.nvim'
  use 'SmiteshP/nvim-navic'

  -- cmp core
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'onsails/lspkind.nvim'

  -- cmp snippets
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'nvim-treesitter/nvim-treesitter'
  use 'ntpeters/vim-better-whitespace'
  use 'windwp/nvim-autopairs'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-fugitive'
  use 'ap/vim-css-color'
  use 'p00f/nvim-ts-rainbow'
  use 'mhinz/vim-signify'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use 'nvim-treesitter/playground'
  use 'simrat39/symbols-outline.nvim'
  use 'RRethy/vim-illuminate'
  use 'folke/lua-dev.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly'
  }
end)
