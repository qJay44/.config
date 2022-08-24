vim.opt.syntax = 'ON'		      -- Syntax highlighting
vim.o.number = true		      -- Position in code

--- Other options --------------------------

vim.o.signcolumn = 'yes'
vim.bo.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

--------------------------------------------

vim.g.mapleader = ' '
vim.cmd([[ so ~/AppData/Local/nvim/legacy.vim ]])

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('n', '<F6>', ':NvimTreeToggle<CR>', {})
keymap('i', '<F6>', '<Esc>:NvimTreeToggle<CR>', {})

local opts = { noremap=true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<c-p>', ':Files<CR>', opts)
keymap('n', '<leader>h', ':History<CR>', opts)

require('plugins')
require('configs')

