--- Keymapping ------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('n', '<F6>', ':NvimTreeToggle<CR>', {})
keymap('i', '<F6>', '<Esc>:NvimTreeToggle<CR>', {})
keymap('n', '<leader>p', '"*p', {})
keymap('n', '<leader>y', '"*y', {})
keymap('n', '<leader>so', ':so $MYVIMRC<CR>:noh<CR>', {})
keymap('n', '<F9>', ':lua vim.lsp.buf.range_formatting()<CR>', {})
keymap('n', '<F11>', ':lua NeovideFullscreen()<CR>', {})
keymap('n', '<C-[>', ':noh<CR>', {}) -- Clear search selection

-- Move selected lines up/down
keymap('v', 'J', ":m '>+1<CR>gv=gv", {})
keymap('v', 'K', ":m '<-2<CR>gv=gv", {})

-- Make cursor at the center when scrolling
keymap('n', '<C-d>', '<C-d>zz', {})
keymap('n', '<C-u>', '<C-u>zz', {})

-- Easymotion
keymap('n', '/', '<Plug>(easymotion-sn)', {})
keymap('o', '/', '<Plug>(easymotion-tn)', {})
keymap('n', 'n', '<Plug>(easymotion-next)', {})
keymap('n', 'N', '<Plug>(easymotion-prev)', {})

local opts = { noremap=true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', "Q", "<cmd>lua DeleteBuffer()<CR>", opts)
keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', opts)
keymap('n', "<leader>h", "<cmd>Telescope oldfiles<CR>", opts)
keymap('n', '<leader><S-r>', '<cmd>lua MyTerminal()<CR>', opts)
keymap('n', ';al', '8o<C-[>7dk', opts)
keymap('n', '<leader>i', 'bi', opts)
keymap('n', '<leader>a', 'ei', opts)
keymap('x', ';s', 'y:%s/<C-r>"//g<Left><Left>', opts)
keymap('x', ';ls', 'y:.s/<C-r>"//g<Left><Left>', opts)

--- Preload ---------------------------

if vim.fn.exists('g:neovide') ~= 0 then
  vim.g.neovide_refresh_rate = 90
  vim.g.neovide_scroll_animation_length = 0.5
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_transparency = 0.85
  vim.g.neovide_fullscreen=false
else
  vim.o.termguicolors = true
end

--- Load plugins and configs ----------

require('plugins')
require('configs')

--- Options ---------------------------

vim.opt.number      = true		        -- Position in code
vim.opt.expandtab   = true            -- Convert tabs to spaces
vim.opt.smartindent = true            -- Make indenting smarter again
vim.opt.shiftwidth  = 2               -- The number of spaces inserted for each indetation
vim.opt.wrap        = false           -- No line wrapping
vim.opt.tabstop     = 2               -- Insert 2 spaces for a tab
vim.opt.signcolumn  = 'yes'           -- The column for line signs
vim.opt.cursorline  = true            -- Highlight current line
vim.opt.backup      = false           -- No backup files
vim.opt.writebackup = false           -- No backup when writting a file in different editors
vim.opt.swapfile    = false           -- No swap files (realtime backup)
vim.opt.updatetime  = 100             -- The lenght of time Vim waits after you stop typing before it triggers the associated plugins
vim.opt.laststatus  = 3               -- Makes statusline unsplittable
vim.opt.pumblend    = 30              -- Popup menu opaque
vim.opt.scrolloff   = 7               -- Show a few lines of context around the cursor

-- Other
vim.o.guifont = "FiraCode Nerd Font:h14"
vim.lsp.set_log_level("off")
vim.g.rooter_patterns = { '.git', 'Makefile', '*.sln', 'build/env.sh', '*.md', "main.py" }

--- Functions --------------------------

-- Nvim tree behavior when deleting a buffer
function DeleteBuffer()
  local tree_status = require'nvim-tree.view'.is_visible()
  if tree_status then
    vim.api.nvim_command('NvimTreeClose')
    vim.api.nvim_command('bdelete')
    vim.api.nvim_command('NvimTreeOpen')
    vim.cmd([[ wincmd l ]])
  else
    vim.api.nvim_command('bdelete')
  end
end

-- Enter/exit fullscreen function
function NeovideFullscreen()
  if vim.g.neovide_fullscreen then
    vim.g.neovide_fullscreen = false
  else
    vim.g.neovide_fullscreen = true
  end
end

----------------------------------------

