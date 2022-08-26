vim.opt.syntax = 'ON'		      -- Syntax highlighting
vim.o.number = true		      -- Position in code

--- Other options ---------------------------

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

---------------------------------------------

vim.g.mapleader = ' '
vim.cmd([[ so ~/AppData/Local/nvim/legacy.vim ]])

-- Nvim tree behavior when deleting a buffer
function close_buffer()
  local tree_status = require'nvim-tree.view'.is_visible()
  if tree_status then
    vim.api.nvim_command('NvimTreeClose')
    vim.api.nvim_command('bdelete')
    vim.api.nvim_command('NvimTreeOpen')
  else
    vim.api.nvim_command('bdelete')
  end
end

--- Keymapping ------------------------------

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('n', '<F6>', ':NvimTreeToggle<CR>', {})
keymap('i', '<F6>', '<Esc>:NvimTreeToggle<CR>', {})
keymap('n', '<leader>so', ':luafile $MYVIMRC<CR>:noh<CR>', {})

local opts = { noremap=true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<c-p>', ':Files<CR>', opts)
keymap('n', '<leader>h', ':History<CR>', opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
keymap("n", "Q", "<cmd>lua close_buffer()<CR>", opts)

---------------------------------------------

require('plugins')
require('configs')

