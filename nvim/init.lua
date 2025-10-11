--- Preload ---------------------------

if vim.fn.exists('g:neovide') == 1 then
  vim.g.neovide_refresh_rate = 90
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_fullscreen = false
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_hide_mouse_when_typing = true

  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
      vim.g.neovide_scroll_animation_length = 0
      vim.g.neovide_cursor_animation_length = 0
    end,
  })

  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.fn.timer_start(200, function()
        vim.g.neovide_scroll_animation_length = 0.7
        vim.g.neovide_cursor_animation_length = 0.06
      end)
    end,
  })
else
  vim.o.termguicolors = true
end
vim.loader.enable()

--- Load plugins and configs ----------

require('keymaps')
require('plugins')
require('setup')

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
vim.opt.winblend    = 10              -- Floating windows opaque
vim.opt.scrolloff   = 7               -- Show a few lines of context around the cursor
vim.opt.cmdheight   = 1               -- Hide command line
vim.opt.shortmess   = 'nocI'          -- Disable prompting for ENTER to continue when cmdheight=0
vim.opt.splitright  = true            -- Vertically split windows will open on the right side
vim.opt.fillchars   = {eob = " "}     -- Hide tildas at the sidebar (missing fields are optional)
vim.opt.mouse=''
-- vim.opt.foldmethod  = 'expr'
-- vim.opt.foldexpr    = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldminlines = 5

-- Other
vim.o.guifont = "FiraCode Nerd Font:h12"
vim.lsp.set_log_level("error")

--- Functions --------------------------

local function NeotreeIsVisible()
  local manager = require("neo-tree.sources.manager")
  local renderer = require("neo-tree.ui.renderer")

  local state = manager.get_state("filesystem")
  return renderer.window_exists(state)
end

-- Nvim tree behavior when deleting a buffer
function DeleteBuffer()
  local tree_status = NeotreeIsVisible()
  if tree_status then
    vim.api.nvim_command('Neotree close')
    vim.api.nvim_command('bdelete')
    vim.api.nvim_command('Neotree show')
  else
    vim.api.nvim_command('bdelete')
  end
end

----------------------------------------

