-- Make sure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins install
require('lazy').setup({
  -- colorschemes
  'tomasr/molokai',
  'ellisonleao/gruvbox.nvim',

  -- LSP
  'neovim/nvim-lspconfig',
  'ray-x/lsp_signature.nvim',
  'SmiteshP/nvim-navic',
  'williamboman/mason-lspconfig.nvim',

  -- DAP
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'jay-babu/mason-nvim-dap.nvim',

  -- Linters
  'mfussenegger/nvim-lint',

  -- CMP core
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'onsails/lspkind.nvim',

  -- CMP snippets
  {'L3MON4D3/LuaSnip', version = "v2.*"},
  'saadparwaiz1/cmp_luasnip',

  -- Other
  'wakatime/vim-wakatime',                          -- Coding time
  'tpope/vim-surround',                             -- Vim surround keymaps
  'tpope/vim-commentary',                           -- Vim comment keymaps
  'airblade/vim-rooter',                            -- Vim workspace setter
  'nvim-treesitter/nvim-treesitter',                -- Better highlight
  'nvim-treesitter/playground',                     -- Usefull treesitter tools
  'ntpeters/vim-better-whitespace',                 -- Highlight extra whitespaces
  'windwp/nvim-autopairs',                          -- Place two parenthesises at once
  'easymotion/vim-easymotion',                      -- Better search                        (Do not forget to use)
  'tpope/vim-fugitive',                             -- Git commands
  'lukas-reineke/indent-blankline.nvim',            -- Improved indents
  'simrat39/symbols-outline.nvim',                  -- Code tree view                       (Do not forget to use)
  'RRethy/vim-illuminate',                          -- Underline the same words
  'folke/neodev.nvim',                              -- Signature help in floating window
  'williamboman/mason.nvim',                        -- Package manager (LSP, DAP, etc.)
  'rcarriga/nvim-notify',                           -- Notifier windows
  'lewis6991/gitsigns.nvim',                        -- Git signs
  'norcalli/nvim-colorizer.lua',                    -- Highlight color codes
  'nvim-lua/plenary.nvim',                          -- Some functions                       (Need to check it more)
  'dstein64/vim-startuptime',                       -- Measure startup time
  'eandrju/cellular-automaton.nvim',                -- Falling sand-like code (and more)

  { 'nvim-telescope/telescope.nvim', version = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  { 'akinsho/toggleterm.nvim', version = '*'},
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  { 'goolord/alpha-nvim', dependencies = { 'kyazdani42/nvim-web-devicons' }, },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { 'linux-cultist/venv-selector.nvim',
    dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap", { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, },
    lazy = false,
    branch = 'regexp',
  }
})

