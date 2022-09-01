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
  -- Packer
  use 'wbthomason/packer.nvim'

  -- colorschemes
  use 'tomasr/molokai'
  use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'SmiteshP/nvim-navic'

  -- CMP core
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'onsails/lspkind.nvim'

  -- CMP snippets
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Other
  use 'wakatime/vim-wakatime'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'airblade/vim-rooter'
  use 'tpope/vim-dispatch'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ntpeters/vim-better-whitespace'
  use 'windwp/nvim-autopairs'
  use 'easymotion/vim-easymotion'
  use 'tpope/vim-fugitive'
  use 'p00f/nvim-ts-rainbow'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use 'nvim-treesitter/playground'
  use 'simrat39/symbols-outline.nvim'
  use 'RRethy/vim-illuminate'
  use 'folke/lua-dev.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'rcarriga/nvim-notify'
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- Plugins which requirements
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly'
  }
end)

