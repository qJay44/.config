local toggleterm = require('toggleterm')

toggleterm.setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  autochdir = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 10,
    highlights = {
      border = 'Normal',
      background = 'Normal'
    }
  }
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<C-[>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal  = require('toggleterm.terminal').Terminal
local launch = Terminal:new({
  cmd = "mingwRelease.bat",
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

function _build_toggle()
  if vim.bo.filetype == "cpp" then
    launch:toggle()
  else
    vim.notify("No toggleterm command for this file yet", vim.log.levels.WARN)
  end
end

vim.api.nvim_set_keymap("n", "<C-F6>", "<cmd>lua _build_toggle()<CR>", {noremap = true, silent = true})

