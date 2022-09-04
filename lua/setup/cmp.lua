local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return vim.notify('cmp', 'error', { title = 'Plugin call fail' })
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return vim.notify('luasnip', 'error', { title = 'Plugin call fail' })
end

require('luasnip.loaders.from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

local cmp_kinds = require('setup.icons').kind

cmp.setup({
  enabled = function()
    local treesitter_capture = require"cmp.config.context".in_treesitter_capture("comment")
    local syntax_group = require"cmp.config.context".in_syntax_group("Comment")
    if treesitter_capture or syntax_group then
      return false
    else
      return true
    end
  end,
  completion = { completeopt = 'menu,menuone,noinsert' },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif check_backspace() then
        -- cmp.complete()
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp', keyword_length = 3, max_item_count = 7 },
      { name = 'luasnip', keyword_length = 3, max_item_count = 7 },
      { name = 'nvim_lua' },
      { name = 'buffer' },
      { name = 'path'}
  }),
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,
  },
  window = {
    documentation = { border = "rounded" },
    completion = { border = 'rounded' }
  },
  experimental = { ghost_text = true }
})

