vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.api.nvim_set_keymap
km('n', '<c-s>', ':silent w<CR>', { silent=true })
km('i', '<c-s>', '<Esc>:silent w<CR>a', { silent=true })
km('n', '<F6>', ':NvimTreeToggle<CR>', { silent=true })
km('i', '<F6>', '<Esc>:NvimTreeToggle<CR>', { silent=true })
km('n', '<leader>p', '"*p', { silent=true })
km('v', '<leader>p', '"*p', { silent=true })
km('n', '<leader>y', '"*y', { silent=true })
km('v', '<leader>y', '"*y', { silent=true })
km('n', '<c-[>', ':noh<CR>', { silent=true }) -- Clear search selection

-- Move selected lines up/down
km('v', 'J', ":m '>+1<CR>gv=gv", {})
km('v', 'K', ":m '<-2<CR>gv=gv", {})

-- Make cursor at the center when scrolling
km('n', '<c-d>', '<c-d>zz', {})
km('n', '<c-u>', '<c-u>zz', {})

local opts = { noremap=true, silent=true }
km('n', '<leader><c-s>', ':silent noau w<CR>', opts)
km('n', '<leader>so', ':so %<CR>:noh<CR>', opts)
km('n', '<c-j>', '<c-w>j', opts)
km('n', '<c-h>', '<c-w>h', opts)
km('n', '<c-k>', '<c-w>k', opts)
km('n', '<c-l>', '<c-w>l', opts)
km('c', '<c-j>', '<Down>', opts)
km('c', '<c-k>', '<Up>', opts)
km('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
km('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
km('n', "Q", "<cmd>lua DeleteBuffer()<CR>", opts)
km('n', '<leader>f', '<cmd>Telescope find_files<CR>', opts)
km('n', "<leader>h", "<cmd>Telescope oldfiles<CR>", opts)
km('n', "<leader>lg", "<cmd>Telescope live_grep<CR>", opts)
km('n', ';al', '8o<C-[>7dk', opts)
km('n', '<leader>t', ':SymbolsOutline<CR>', opts)

km('x', ';s', 'y:%s/<c-r>"//g<Left><Left>', { noremap=true })
km('x', ';ls', 'y:.s/<c-r>"//g<Left><Left>', { noremap=true })

--- LSP --------------------------

-- km("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
-- km("n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
km("n", "K", "<cmd>lua vim.lsp.buf.hover({border = 'rounded'})<CR>", opts)
km("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
km("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
km("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
km("n", "gs", "<cmd>lua vim.lsp.buf.signature_help({border = 'rounded'})<CR>", opts)
km("n", "<M-f>", "<cmd>Format<cr>", opts)
km("n", "<M-a>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- km("n", "<M-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
km("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
km("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- km("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- km("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- km("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- km("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--
