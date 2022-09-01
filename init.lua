vim.notify = require('notify')
require('plugins')
require('configs')

--- Options ---------------------------

vim.cmd([[ so ~/AppData/Local/nvim/legacy.vim ]])
vim.opt.number = true		              -- Position in code
vim.opt.expandtab = true              -- Convert tabs to spaces
vim.opt.smartindent = true            -- Make indenting smarter again
vim.opt.shiftwidth = 2                -- The number of spaces inserted for each indetation
vim.opt.wrap = false                  -- No line wrapping
vim.opt.tabstop = 2                   -- Insert 2 spaces for a tab
vim.opt.signcolumn = 'yes'            -- The column for line signs
vim.opt.cursorline = true             -- Highlight current line
vim.opt.backup = false                -- No backup files
vim.opt.writebackup = false           -- No backup when writting a file in different editors
vim.opt.swapfile = false              -- No swap files (realtime backup)
vim.opt.updatetime = 100              -- The lenght of time Vim waits after you stop typing before it triggers the associated plugins
vim.opt.laststatus = 3                -- Makes statuline unsplittable
vim.opt.pumblend = 30                 -- Popup menu opaque

---------------------------------------------

-- Nvim tree behavior when deleting a buffer
function close_buffer()
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

--- Keymapping ------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('n', '<F6>', ':NvimTreeToggle<CR>', {})
keymap('i', '<F6>', '<Esc>:NvimTreeToggle<CR>', {})
keymap('n', '<leader>p', '"*p', {})
keymap('n', '<leader>so', ':so $MYVIMRC<CR>:noh<CR>', {})

local opts = { noremap=true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
keymap("n", "Q", "<cmd>lua close_buffer()<CR>", opts)
keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', opts)

---------------------------------------------

