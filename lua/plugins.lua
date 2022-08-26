-- Protected call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
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
return packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- colorschemes
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

  -- cmp core
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- cmp snippets
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

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
  use 'mhinz/vim-signify'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use 'nvim-treesitter/playground'
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly'
  }
end)
