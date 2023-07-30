local packer = require('packer')

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
  use 'ellisonleao/gruvbox.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'ray-x/lsp_signature.nvim'
  use 'SmiteshP/nvim-navic'
  use 'williamboman/mason-lspconfig.nvim'

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'jay-babu/mason-nvim-dap.nvim'

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
  use 'wakatime/vim-wakatime'                           -- Wakatime                             (Unupdateble?)
  use 'tpope/vim-surround'                              -- Vim surround keymaps
  use 'tpope/vim-commentary'                            -- Vim comment keymaps
  use 'airblade/vim-rooter'                             -- Vim workspace setter
  use 'nvim-treesitter/nvim-treesitter'                 -- TS
  use 'ntpeters/vim-better-whitespace'                  -- Highlight extra whitespaces
  use 'windwp/nvim-autopairs'                           -- Place two perantheses at once
  use 'easymotion/vim-easymotion'                       -- Better search                        (Do not forget to use)
  use 'tpope/vim-fugitive'                              -- Git commands
  use 'lukas-reineke/indent-blankline.nvim'             -- Improved indents
  use 'nvim-treesitter/playground'                      -- Usefull treesitter tools
  use 'simrat39/symbols-outline.nvim'                   -- Tree view                            (Do not forget to use)
  use 'RRethy/vim-illuminate'                           -- Underline word under cursor
  use 'folke/neodev.nvim'                               -- Signature help in floating window
  use 'williamboman/mason.nvim'                         -- Package manager (LSP, DAP, etc.)
  use 'rcarriga/nvim-notify'                            -- Notifier windows
  use 'lewis6991/gitsigns.nvim'                         -- Git signs
  use 'norcalli/nvim-colorizer.lua'                     -- Highlight color codes
  use 'nvim-lua/plenary.nvim'                           -- Some functions                       (Need to check it more)
  use 'jose-elias-alvarez/null-ls.nvim'                 -- Use formatters on buffers
  use 'dstein64/vim-startuptime'                        -- Measure startup time

  use { 'nvim-telescope/telescope.nvim', tag = '0.1.2', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'akinsho/bufferline.nvim', tag = '*', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'akinsho/toggleterm.nvim', tag = '*'}
  use { 'nvim-tree/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' }, }
end)

